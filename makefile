PROJECT_ROOT	= ${strip ${dir ${realpath ${lastword ${MAKEFILE_LIST}}}}}

CC				= gcc
CPP				= g++

CFLAGS			= -Wall -Wpedantic -Wextra
RELEASE_FLAGS	= -O3 -g -Wl,--verbose
DEBUG_FLAGS		= -O0 -g -Wl,--verbose

CSTD			= --std=gnu11
CPPSTD			= --std=gnu++2a

MAIN			= ${PROJECT_ROOT}/src/chiyotatsu.cpp
UTILC			= ${wildcard ${PROJECT_ROOT}/src/utils/*.c}
UTILCPP			= ${wildcard ${PROJECT_ROOT}/src/utils/*.cpp}
PROTO_FILES		= ${wildcard ${PROJECT_ROOT}/proto_files/*.proto}
PROTOCPP		= ${patsubst ${PROJECT_ROOT}/proto_files/%.proto,${PROJECT_ROOT}/src/compiled_proto/%.pb.cc,${PROTO_FILES}}

UTILCO			= ${patsubst %.c,%.o,${UTILC}}
UTILCPPO		= ${patsubst %.cpp,%.o,${UTILCPP}}
PROTO_O			= ${patsubst %.cc,%.o,${PROTOCPP}}

ELF				= chiyotatsu.elf
EXE				= chiyotatsu.exe

# Define this if you wanna use mingw or something else?
PREFIX			=

default:
	@echo "It would be better if this was run with the 'clean' argument first"
	@echo "Then use the elf_debug or elf_release with an empty PREFIX="
	@echo "variable to signify you're compiling for linux and is not using"
	@echo "something like mingw"
	@echo "To compile for windows use the arguments"
	@echo "exe_release PREFIX='x86_64-w64-mingw32-'"
	@echo "Project Root Dir: ${PROJECT_ROOT}"

clean:
	-@rm -f  ${PROJECT_ROOT}/src/utils/*.o
	-@rm -f  ${PROJECT_ROOT}/src/compiled_proto/*.o
	-@rm -f  ${PROJECT_ROOT}/src/compiled_proto/*.cc
	-@rm -f  ${PROJECT_ROOT}/src/compiled_proto/*.pb.h
	-@rm -fr ${PROJECT_ROOT}/libs_lin/lib/*
	-@rm -fr ${PROJECT_ROOT}/libs_lin/include/*
	-@rm -fr ${PROJECT_ROOT}/libs_win/lib/*
	-@rm -fr ${PROJECT_ROOT}/libs_win/include/*
	-@rm -fr ${PROJECT_ROOT}/extern/protobuf/build/win
	-@rm -fr ${PROJECT_ROOT}/extern/protobuf/build/lin
	@echo    "Removing ${PROJECT_ROOT}/src/utils/*.o"
	@echo    "Removing ${PROJECT_ROOT}/src/compiled_proto/*.o"
	@echo    "Removing ${PROJECT_ROOT}/src/compiled_proto/*.cc"
	@echo    "Removing ${PROJECT_ROOT}/src/compiled_proto/*.pb.h"
	@echo    "Removing ${PROJECT_ROOT}/libs_lin/lib/*"
	@echo    "Removing ${PROJECT_ROOT}/libs_lin/include/*"
	@echo    "Removing ${PROJECT_ROOT}/libs_win/lib/*"
	@echo    "Removing ${PROJECT_ROOT}/libs_win/include/*"
	@echo    "Removing ${PROJECT_ROOT}/extern/protobuf/build/win"
	@echo    "Removing ${PROJECT_ROOT}/extern/protobuf/build/lin"

elf_debug: ${PROJECT_ROOT}/libs_lin/lib/libz.so\
	${PROJECT_ROOT}/libs_lin/lib/libprotobuf.so\
	${UTILCO} ${UTILCPPO} ${PROTOCPP} ${PROTO_O}
	@if [ ! -e ${ELF} ]; then\
		echo "Linking ${ELF}";\
		${CPP} -v ${CFLAGS} ${CPPSTD} ${DEBUG_FLAGS}\
			-o ${ELF} ${MAIN}\
			${UTILCO}\
			${UTILCPPO}\
			${PROTO_O}\
			$$(\
				PKG_CONFIG_PATH=${PROJECT_ROOT}/libs_lin/lib/pkgconfig\
					pkg-config --cflags --libs protobuf zlib\
			);\
	fi
	@echo "Linked target ${ELF}"

elf_release: ${PROJECT_ROOT}/libs_lin/lib/libz.a\
	${PROJECT_ROOT}/libs_lin/lib/libprotobuf.a\
	${UTILCO} ${UTILCPPO} ${PROTOCPP} ${PROTO_O}
	@if [ ! -e ${ELF} ]; then\
		echo "Linking ${ELF}";\
		${CPP} -v ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS} --static\
			-o ${ELF} ${MAIN}\
			${UTILCO}\
			${UTILCPPO}\
			${PROTO_O}\
			$$(\
				PKG_CONFIG_PATH=${PROJECT_ROOT}/libs_lin/lib/pkgconfig\
					pkg-config --cflags --libs protobuf zlib\
			);\
		strip ${ELF};\
	fi
	@echo "Linked target ${ELF}"

exe_release: ${PROJECT_ROOT}/libs_win/lib/libz.dll.a\
	${PROJECT_ROOT}/libs_win/lib/libprotobuf.dll.a\
	${UTILCO} ${UTILCPPO} ${PROTOCPP} ${PROTO_O}
	@if [ ! -e ${EXE} ]; then\
		echo "Linking ${EXE}";\
		${PREFIX}${CPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS} --static\
			-o ${EXE} ${MAIN}\
			${UTILCO}\
			${UTILCPPO}\
			${PROTO_O}\
			$$(\
				PKG_CONFIG_PATH=${PROJECT_ROOT}/libs_lin/lib/pkgconfig\
					${PREFIX}pkg-config --cflags --libs protobuf zlib\
			);\
	fi
	@echo "Linked target ${EXE}"

%.o: %.c
	@if [ ! -e $@ ]; then\
		echo "Building C object ${@}";\
		${PREFIX}${CC} ${CFLAGS} ${CSTD} ${RELEASE_FLAGS}\
			-o $@\
			-c $<\
			$$(\
				PKG_CONFIG_PATH=${PROJECT_ROOT}/libs_lin/lib/pkgconfig\
					pkg-config --cflags protobuf zlib\
			);\
	fi
	@echo "Built target ${@}"

%.o: %.cpp
	@if [ ! -e $@ ]; then\
		echo "Building CXX object ${@}";\
		${PREFIX}${CPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS}\
			-o $@\
			-c $<\
			$$(\
				PKG_CONFIG_PATH=${PROJECT_ROOT}/libs_lin/lib/pkgconfig\
					pkg-config --cflags protobuf zlib\
			);\
	fi
	@echo "Built target ${@}"

%.o: %.cc
	@if [ ! -e $@ ]; then\
		echo "Building CXX object ${@}";\
		${PREFIX}${CPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS}\
			-o $@\
			-c $<\
			$$(\
				PKG_CONFIG_PATH=${PROJECT_ROOT}/libs_lin/lib/pkgconfig\
					pkg-config --cflags protobuf zlib\
			);\
	fi
	@echo "Built target ${@}"

${PROJECT_ROOT}/src/compiled_proto/%.pb.cc: ${PROJECT_ROOT}/proto_files/%.proto
	@if [ -e ${PROJECT_ROOT}/libs_lin/bin/protoc ]; then\
		${PROJECT_ROOT}/libs_lin/bin/protoc -I$$(pwd)/proto_files\
			--cpp_out=${PROJECT_ROOT}/src/compiled_proto\
			${notdir $<};\
	elif [ -e ${PROJECT_ROOT}/libs_win/bin/protoc.exe ]; then\
		${PROJECT_ROOT}/libs_win/bin/protoc.exe -I$$(pwd)/proto_files\
			--cpp_out=${PROJECT_ROOT}/src/compiled_proto\
			${notdir $<};\
	fi

${PROJECT_ROOT}/libs_lin/lib/libz.a:
	@if [ ! -d ${PROJECT_ROOT}/libs_lin ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_lin/lib ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin/lib;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_lin/include ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin/include;\
	fi
	cd ${PROJECT_ROOT}/extern/zlib/; ./configure\
		--prefix=${PROJECT_ROOT}/libs_lin
	${MAKE} -C ${PROJECT_ROOT}/extern/zlib -j4 install

${PROJECT_ROOT}/libs_lin/lib/libabsl_base.a:
	@if [ ! -d ${PROJECT_ROOT}/libs_lin ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_lin/lib ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin/lib;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_lin/include ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin/include;\
	fi
	cmake -B ./extern/abseil-cpp/build/lin\
		-DCMAKE_INSTALL_PREFIX=libs_lin/\
		./extern/abseil-cpp/
	${MAKE} -C ./extern/abseil-cpp/build/lin -j4 install

${PROJECT_ROOT}/libs_lin/lib/libprotobuf.a:
	@if [ ! -d ${PROJECT_ROOT}/libs_lin ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_lin/lib ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin/lib;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_lin/include ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin/include;\
	fi
	cmake -B ${PROJECT_ROOT}/extern/protobuf/build/lin\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}/libs_lin/\
		-Dprotobuf_ABSL_PROVIDER='module'\
		-Dprotobuf_USE_EXTERNAL_GTEST=OFF\
		${PROJECT_ROOT}/extern/protobuf/
	make -C ${PROJECT_ROOT}/extern/protobuf/build/lin -j4 install

${PROJECT_ROOT}/libs_lin/lib/libz.so:
	@if [ ! -d ${PROJECT_ROOT}/libs_lin ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_lin/lib ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin/lib;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_lin/include ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin/include;\
	fi
	cd ${PROJECT_ROOT}/extern/zlib/; ./configure \
		--prefix=${PROJECT_ROOT}/libs_lin\
		--enable-shared
	make -C ./extern/zlib -j4 install

${PROJECT_ROOT}/libs_lin/lib/libprotobuf.so:
	@if [ ! -d ${PROJECT_ROOT}/libs_lin ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_lin/lib ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin/lib;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_lin/include ]; then\
		mkdir ${PROJECT_ROOT}/libs_lin/include;\
	fi
	cmake -B ./${PROJECT_ROOT}/extern/protobuf/build/lin\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}/libs_lin/\
		-Dprotobuf_ABSL_PROVIDER='module'\
		-Dprotobuf_BUILD_SHARED_LIBS=ON\
		-Dprotobuf_USE_EXTERNAL_GTEST=OFF\
		${PROJECT_ROOT}/extern/protobuf/
	make -C ${PROJECT_ROOT}/extern/protobuf/build/lin -j4 install

${PROJECT_ROOT}/libs_win/lib/libz.dll.a:
	@if [ ! -d ${PROJECT_ROOT}/libs_win ]; then\
		mkdir ${PROJECT_ROOT}/libs_win;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_win/lib ]; then\
		mkdir ${PROJECT_ROOT}/libs_win/lib;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_win/include ]; then\
		mkdir ${PROJECT_ROOT}/libs_win/include;\
	fi
	cd ${PROJECT_ROOT}/extern/zlib/; ./configure\
		--prefix=${PROJECT_ROOT}/libs_win
	make -C ./${PROJECT_ROOT}/extern/zlib\
		-fwin32/Makefile.gcc -j4\
		PREFIX=${PREFIX} install

${PROJECT_ROOT}libs_win/lib/libabsl_base.dll:
	@if [ ! -d ${PROJECT_ROOT}/libs_win ]; then\
		mkdir ${PROJECT_ROOT}/libs_win;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_win/lib ]; then\
		mkdir ${PROJECT_ROOT}/libs_win/lib;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_win/include ]; then\
		mkdir ${PROJECT_ROOT}/libs_win/include;\
	fi
	${PREFIX}cmake -B ${PROJECT_ROOT}/extern/abseil-cpp/build/win\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}/libs_lin/\
		${PROJECT_ROOT}/extern/abseil-cpp/
	make -C ./extern/abseil-cpp/build/win -j4 install

${PROJECT_ROOT}/libs_win/lib/libprotobuf.dll.a:
	@if [ ! -d ${PROJECT_ROOT}/libs_win ]; then\
		mkdir ${PROJECT_ROOT}/libs_win;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_win/lib ]; then\
		mkdir ${PROJECT_ROOT}/libs_win/lib;\
	fi
	@if [ ! -d ${PROJECT_ROOT}/libs_win/include ]; then\
		mkdir ${PROJECT_ROOT}/libs_win/include;\
	fi
	${PREFIX}cmake -B ${PROJECT_ROOT}/extern/protobuf/build/win \
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}/libs_win/\
		-Dprotobuf_ABSL_PROVIDER='module'\
		-Dprotobuf_USE_EXTERNAL_GTEST=OFF\
		${PROJECT_ROOT}/extern/protobuf/
	make -C ${PROJECT_ROOT}/extern/protobuf/build/win \
		-j4 install

.PHONY: default clean elf_debug elf_release exe_release
