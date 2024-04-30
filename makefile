PROJECT_ROOT	= ${strip ${dir ${realpath ${lastword ${MAKEFILE_LIST}}}}}

CC				= gcc
CPP				= g++
CFLAGS			= -Wall -Wpedantic -Wextra
RELEASE_FLAGS	= -O3 -g
DEBUG_FLAGS		= -O0 -g
CSTD			= --std=gnu11
CPPSTD			= --std=gnu++2a

MAIN			= ${PROJECT_ROOT}src/chiyotatsu.cpp
UTILC			= ${wildcard ${PROJECT_ROOT}src/utils/*.c}
UTILCPP			= ${MAIN} ${wildcard ${PROJECT_ROOT}src/utils/*.cpp}
PROTO_FILES		= ${wildcard ${PROJECT_ROOT}proto_files/*.proto}
PROTOCPP		= ${patsubst ${PROJECT_ROOT}proto_files/%.proto,${PROJECT_ROOT}src/compiled_proto/%.pb.cc,${PROTO_FILES}}

UTILCO			= ${patsubst %.c,%.o,${UTILC}}
UTILCPPO		= ${patsubst %.cpp,%.o,${UTILCPP}}
PROTO_O			= ${patsubst %.cc,%.o,${PROTOCPP}}

LIBS_USED		= protobuf zlib
# Define this if you wanna use mingw or something else?
PREFIX			=

ELF				= chiyotatsu.elf
EXE				= chiyotatsu.exe

WIN32			= ${PROJECT_ROOT}libs_win/32/lib/libz.dll.a ${PROJECT_ROOT}libs_win/32/lib/libprotobuf.dll.a
WIN64			= ${PROJECT_ROOT}libs_win/64/lib/libz.dll.a ${PROJECT_ROOT}libs_win/64/lib/libprotobuf.dll.a
LIN32			= ${PROJECT_ROOT}libs_lin/32/lib/libz.a ${PROJECT_ROOT}libs_lin/32/lib/libprotobuf.a
LIN64			= ${PROJECT_ROOT}libs_lin/64/lib/libz.a ${PROJECT_ROOT}libs_lin/64/lib/libprotobuf.a\
				  ${PROJECT_ROOT}libs_lin/64/lib/libz.so ${PROJECT_ROOT}libs_lin/64/lib/libprotobuf.so

default:
	@echo "It would be better if this was run with the 'clean' argument first"
	@echo "Then use the elf_debug or elf_release with an empty PREFIX="
	@echo "variable to signify you're compiling for linux and is not using"
	@echo "something like mingw"
	@echo "To compile for windows use the arguments"
	@echo "exe_release PREFIX='x86_64-w64-mingw32-'"
	@echo "Project Root Dir: ${PROJECT_ROOT}"

clean:
	@echo    "Removing ${PROJECT_ROOT}src/utils/*.o"
	-@rm -f  ${PROJECT_ROOT}src/utils/*.o
	@echo    "Removing ${PROJECT_ROOT}src/compiled_proto/*.o"
	-@rm -f  ${PROJECT_ROOT}src/compiled_proto/*.o
	@echo    "Removing ${PROJECT_ROOT}src/compiled_proto/*.cc"
	-@rm -f  ${PROJECT_ROOT}src/compiled_proto/*.cc
	@echo    "Removing ${PROJECT_ROOT}src/compiled_proto/*.pb.h"
	-@rm -f  ${PROJECT_ROOT}src/compiled_proto/*.pb.h

elf_debug: ${LIN64} ${PROTOCPP} ${UTILCO} ${UTILCPPO} ${PROTO_O}
	@echo "Linking ${ELF}"
	@${CPP} ${CFLAGS}\
		${INCL}\
		${CPPSTD} ${DEBUG_FLAGS}\
		-o ${ELF}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		${LIBS}

elf_release_32: ${LIN32} ${PROTOCPP} ${UTILCO} ${UTILCPPO} ${PROTO_O}
	@echo "Linking ${ELF}"
	@${CPP} ${CFLAGS}\
		${INCL}\
		${CPPSTD} ${RELEASE_FLAGS}\
		--static -m32\
		-o ${ELF}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		${LIBS}
	@strip ${ELF}

elf_release_64: ${LIN64} ${PROTOCPP} ${UTILCO} ${UTILCPPO} ${PROTO_O}
	@echo "Linking ${ELF}"
	@${CPP} ${CFLAGS}\
		${INCL}\
		${CPPSTD} ${RELEASE_FLAGS}\
		--static -m64\
		-o ${ELF}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		${LIBS}
	@strip ${ELF}

exe_release_32: ${WIN32} ${PROTOCPP} ${UTILCO} ${UTILCPPO} ${PROTO_O}
	@echo "Linking ${EXE}"
	@${PREFIX}${CPP} ${CFLAGS}\
		${INCL}\
		${CPPSTD} ${RELEASE_FLAGS}\
		--static -m32\
		-o ${EXE}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		${LIBS}

exe_release_64: ${WIN64} ${PROTOCPP} ${UTILCO} ${UTILCPPO} ${PROTO_O}
	@echo "Linking ${EXE}"
	@${PREFIX}${CPP} ${CFLAGS}\
		${INCL}\
		${CPPSTD} ${RELEASE_FLAGS}\
		--static -m64\
		-o ${EXE}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		${LIBS}

%.o: %.c
	@echo "Building C object ${@}"
	@${PREFIX}${CC} ${CFLAGS}\
		${INCL}\
		${CSTD} ${RELEASE_FLAGS}\
		-o $@\
		-c $<

%.o: %.cpp
	@echo "Building CXX object ${@}"
	@${PREFIX}${CPP} ${CFLAGS}\
		${INCL}\
		${CPPSTD} ${RELEASE_FLAGS}\
		-o $@\
		-c $<

%.o: %.cc
	@echo "Building CXX object ${@}"
	@${PREFIX}${CPP} ${CFLAGS}\
		${INCL}\
		${CPPSTD} ${RELEASE_FLAGS}\
		-o $@\
		-c $<

${PROJECT_ROOT}src/compiled_proto/%.pb.cc: ${PROJECT_ROOT}proto_files/%.proto
	@if command -v protoc > /dev/null; then\
		echo "Building from proto file ${@}";\
		protoc -I$$(pwd)/proto_files\
			--cpp_out=${PROJECT_ROOT}src/compiled_proto\
			${notdir $<};\
	fi

${PROJECT_ROOT}libs_lin/32/lib/libz.a:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/32/include]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/32/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/32/lib;\
	fi
	cd ${PROJECT_ROOT}extern/zlib/; ./configure\
		--prefix=${PROJECT_ROOT}libs_lin/32
	${MAKE} -C ${PROJECT_ROOT}extern/zlib -j4 install

${PROJECT_ROOT}libs_lin/32/lib/libprotobuf.a:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/32/include]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/32/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/32/lib;\
	fi
	cmake -B ${PROJECT_ROOT}extern/protobuf/build/lin32\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/32\
		-Dprotobuf_ABSL_PROVIDER='module'\
		-Dprotobuf_USE_EXTERNAL_GTEST=OFF\
		${PROJECT_ROOT}extern/protobuf/
	make -C ${PROJECT_ROOT}extern/protobuf/build/lin32 -j4 install

${PROJECT_ROOT}libs_lin/64/lib/libz.a:
	cd ${PROJECT_ROOT}extern/zlib/; ./configure\
		--prefix=${PROJECT_ROOT}libs_lin/64
	${MAKE} -C ${PROJECT_ROOT}extern/zlib -j4 install

${PROJECT_ROOT}libs_lin/64/lib/libprotobuf.a:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	cmake -B ${PROJECT_ROOT}extern/protobuf/build/lin64\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/64\
		-Dprotobuf_ABSL_PROVIDER='module'\
		-Dprotobuf_USE_EXTERNAL_GTEST=OFF\
		${PROJECT_ROOT}extern/protobuf/
	make -C ${PROJECT_ROOT}extern/protobuf/build/lin64 -j4 install

${PROJECT_ROOT}libs_lin/64/lib/libz.so:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	cd ${PROJECT_ROOT}extern/zlib/; ./configure \
		--prefix=${PROJECT_ROOT}libs_lin/64\
		--enable-shared
	make -C ./extern/zlib -j4 install

${PROJECT_ROOT}libs_lin/64/lib/libprotobuf.so:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	cmake -B ./${PROJECT_ROOT}extern/protobuf/build/lin64\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/64\
		-Dprotobuf_ABSL_PROVIDER='module'\
		-Dprotobuf_BUILD_SHARED_LIBS=ON\
		-Dprotobuf_USE_EXTERNAL_GTEST=OFF\
		${PROJECT_ROOT}extern/protobuf/
	make -C ${PROJECT_ROOT}extern/protobuf/build/lin64 -j4 install

${PROJECT_ROOT}libs_win/32/lib/libz.dll.a:
	@if [ ! -d ${PROJECT_ROOT}libs_win/32/include]; then\
		mkdir -p ${PROJECT_ROOT}libs_win/32/include;\
		mkdir -p ${PROJECT_ROOT}libs_win/32/lib;\
	fi
	cd ${PROJECT_ROOT}extern/zlib/; ./configure\
		--prefix=${PROJECT_ROOT}libs_win/32
	make -C ./${PROJECT_ROOT}extern/zlib\
		-fwin32/Makefile.gcc -j4\
		PREFIX=${PREFIX} install

${PROJECT_ROOT}libs_win/32/lib/libprotobuf.dll.a:
	@if [ ! -d ${PROJECT_ROOT}libs_win/32/include]; then\
		mkdir -p ${PROJECT_ROOT}libs_win/32/include;\
		mkdir -p ${PROJECT_ROOT}libs_win/32/lib;\
	fi
	${PREFIX}cmake -B ${PROJECT_ROOT}extern/protobuf/build/win32\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_win/\
		-Dprotobuf_ABSL_PROVIDER='module'\
		-Dprotobuf_USE_EXTERNAL_GTEST=OFF\
		${PROJECT_ROOT}extern/protobuf/
	make -C ${PROJECT_ROOT}extern/protobuf/build/win32\
		-j4 install

${PROJECT_ROOT}libs_win/64/lib/libz.dll.a:
	@if [ ! -d ${PROJECT_ROOT}libs_win/64/include]; then\
		mkdir -p ${PROJECT_ROOT}libs_win/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_win/64/lib;\
	fi
	cd ${PROJECT_ROOT}extern/zlib/; ./configure\
		--prefix=${PROJECT_ROOT}libs_win/64
	make -C ./${PROJECT_ROOT}extern/zlib\
		-fwin32/Makefile.gcc -j4\
		PREFIX=${PREFIX} install

${PROJECT_ROOT}libs_win/64/lib/libprotobuf.dll.a:
	@if [ ! -d ${PROJECT_ROOT}libs_win/64/include]; then\
		mkdir -p ${PROJECT_ROOT}libs_win/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_win/64/lib;\
	fi
	${PREFIX}cmake -B ${PROJECT_ROOT}extern/protobuf/build/win64\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_win/\
		-Dprotobuf_ABSL_PROVIDER='module'\
		-Dprotobuf_USE_EXTERNAL_GTEST=OFF\
		${PROJECT_ROOT}extern/protobuf/
	make -C ${PROJECT_ROOT}extern/protobuf/build/win64\
		-j4 install

.PHONY: default clean elf_debug elf_release exe_release
