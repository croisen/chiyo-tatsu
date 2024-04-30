PROJECT_ROOT	= ${strip ${dir ${realpath ${lastword ${MAKEFILE_LIST}}}}}

CC				= gcc
CPP				= g++
CFLAGS			= -Wall -Wpedantic -Wextra
RELEASE_FLAGS	= -O3 -g
DEBUG_FLAGS		= -O0 -g

MAIN			= ${PROJECT_ROOT}src/chiyotatsu.cpp
UTILC			= ${wildcard ${PROJECT_ROOT}src/utils/*.c}
UTILCPP			= ${MAIN} ${wildcard ${PROJECT_ROOT}src/utils/*.cpp}
PROTO_FILES		= ${wildcard ${PROJECT_ROOT}proto_files/*.proto}
PROTOCPP		= ${patsubst ${PROJECT_ROOT}proto_files/%.proto,${PROJECT_ROOT}src/compiled_proto/%.pb.cc,${PROTO_FILES}}

UTILCO			= ${patsubst %.c,%.o,${UTILC}}
UTILCPPO		= ${patsubst %.cpp,%.o,${UTILCPP}}
PROTO_O			= ${patsubst %.cc,%.o,${PROTOCPP}}

# Define this if you wanna use mingw or something else?
PREFIX			=
LIBS_USED		= protobuf zlib

ELF				= chiyotatsu.elf
LIN32			= ${PROJECT_ROOT}libs_lin/32/lib/libz.a ${PROJECT_ROOT}libs_lin/32/lib/libprotobuf.a
LIN64			= ${PROJECT_ROOT}libs_lin/64/lib/libz.a ${PROJECT_ROOT}libs_lin/64/lib/libprotobuf.a
LIN64_DYN		= ${PROJECT_ROOT}libs_lin/64/lib/libz.so ${PROJECT_ROOT}libs_lin/64/lib/libprotobuf.so

default:
	@echo "It would be better if this was run with the 'clean' argument first"
	@echo "Then use the elf_debug or elf_release with an empty PREFIX="
	@echo "variable to signify you're compiling for linux and is not using"
	@echo "something like mingw"
	@echo "To compile for windows use the arguments"
	@echo "exe_release PREFIX='x86_64-w64-mingw32-'"
	@echo "Project Root Dir: ${PROJECT_ROOT}"

clean:
	@echo   "Removing ${PROJECT_ROOT}src/utils/*.o"
	-@rm -f  ${PROJECT_ROOT}src/utils/*.o
	@echo    "Removing ${PROJECT_ROOT}src/compiled_proto/*.o"
	-@rm -f  ${PROJECT_ROOT}src/compiled_proto/*.o
	@echo    "Removing ${PROJECT_ROOT}src/compiled_proto/*.cc"
	-@rm -f  ${PROJECT_ROOT}src/compiled_proto/*.cc
	@echo    "Removing ${PROJECT_ROOT}src/compiled_proto/*.pb.h"
	-@rm -f  ${PROJECT_ROOT}src/compiled_proto/*.pb.h
	@echo    "Removing ${PROJECT_ROOT}libs_lin/32/lib/*"
	-@rm -fr ${PROJECT_ROOT}libs_lin/32/lib/*
	@echo    "Removing ${PROJECT_ROOT}libs_lin/64/lib/*"
	-@rm -fr ${PROJECT_ROOT}libs_lin/64/lib/*

elf_debug: ${LIN64_DYN} ${PROTOCPP} ${UTILCO} ${UTILCPPO} ${PROTO_O}
	@echo "Linking ${ELF}"
	@${CPP} ${CFLAGS}\
		${DEBUG_FLAGS}\
		-o ${ELF}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		$$(\
			PKG_CONFIG_PATH=${PROJECT_ROOT}libs_lin/64/lib/pkgconfig\
			pkg-config --cflags --libs ${LIBS_USED}\
		)

elf_release_32: ${LIN32} ${PROTOCPP} ${UTILCO} ${UTILCPPO} ${PROTO_O}
	@echo "Linking ${ELF}"
	@${CPP} ${CFLAGS}\
		${RELEASE_FLAGS}\
		--static -m32\
		-o ${ELF}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		$$(\
			PKG_CONFIG_PATH=${PROJECT_ROOT}libs_lin/32/lib/pkgconfig\
			pkg-config --cflags --libs ${LIBS_USED}\
		)
	@strip ${ELF}

elf_release_64: ${LIN64} ${PROTOCPP} ${UTILCO} ${UTILCPPO} ${PROTO_O}
	@echo "Linking ${ELF}"
	${CPP} ${CFLAGS}\
		${RELEASE_FLAGS}\
		--static -m64\
		-o ${ELF}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		$$(\
			PKG_CONFIG_PATH=${PROJECT_ROOT}libs_lin/64/lib/pkgconfig\
			pkg-config --cflags --libs ${LIBS_USED}\
		)
	@strip ${ELF}

%.o: %.c
	@echo "Building C object ${@}"
	@${PREFIX}${CC} ${CFLAGS}\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<\
		$$(\
			PKG_CONFIG_PATH=${PROJECT_ROOT}libs_lin/64/lib/pkgconfig\
			pkg-config --cflags ${LIBS_USED}\
		)

%.o: %.cpp
	@echo "Building CXX object ${@}"
	@${PREFIX}${CPP} ${CFLAGS}\
		${INCL}\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<\
		$$(\
			PKG_CONFIG_PATH=${PROJECT_ROOT}libs_lin/64/lib/pkgconfig\
			pkg-config --cflags ${LIBS_USED}\
		)

%.o: %.cc
	@echo "Building CXX object ${@}"
	@${PREFIX}${CPP} ${CFLAGS}\
		${INCL}\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<\
		$$(\
			PKG_CONFIG_PATH=${PROJECT_ROOT}libs_lin/64/lib/pkgconfig\
			pkg-config --cflags ${LIBS_USED}\
		)

${PROJECT_ROOT}src/compiled_proto/%.pb.cc: ${PROJECT_ROOT}proto_files/%.proto
	@if [ -e ${PROJECT_ROOT}libs_lin/64/bin/protoc ]; then\
		echo "Building from proto file ${@}";\
		${PROJECT_ROOT}libs_lin/64/bin/protoc -I${PROJECT_ROOT}proto_files\
			--cpp_out=${PROJECT_ROOT}src/compiled_proto\
			${notdir $<};\
	elif [ -e ${PROJECT_ROOT}libs_lin/32/bin/protoc ]; then\
		echo "Building from proto file ${@}";\
		${PROJECT_ROOT}libs_lin/32/bin/protoc -I${PROJECT_ROOT}proto_files\
			--cpp_out=${PROJECT_ROOT}src/compiled_proto\
			${notdir $<};\
	fi

${PROJECT_ROOT}libs_lin/32/lib/libz.a:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/32/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/32/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/32/lib;\
	fi
	cd ${PROJECT_ROOT}extern/zlib/; ./configure\
		--prefix=${PROJECT_ROOT}libs_lin/32
	${MAKE} -C ${PROJECT_ROOT}extern/zlib -j4 install

${PROJECT_ROOT}libs_lin/32/lib/libprotobuf.a:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/32/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/32/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/32/lib;\
	fi
	cmake -B ${PROJECT_ROOT}extern/protobuf/build/lin32\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/32\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_STANDARD=14\
		-Dprotobuf_ABSL_PROVIDER='module'\
		-Dprotobuf_BUILD_TESTS=OFF\
		${PROJECT_ROOT}extern/protobuf/
	make -C ${PROJECT_ROOT}extern/protobuf/build/lin32 -j4 install

${PROJECT_ROOT}libs_lin/64/lib/libz.a:
	cd ${PROJECT_ROOT}extern/zlib/; ./configure\
		--prefix=${PROJECT_ROOT}libs_lin/64
	${MAKE} -C ${PROJECT_ROOT}extern/zlib -j4 install

${PROJECT_ROOT}libs_lin/64/lib/libprotobuf.a:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	cmake -B ${PROJECT_ROOT}extern/protobuf/build/lin64\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_STANDARD=14\
		-Dprotobuf_ABSL_PROVIDER='module'\
		-Dprotobuf_BUILD_TESTS=OFF\
		${PROJECT_ROOT}extern/protobuf/
	make -C ${PROJECT_ROOT}extern/protobuf/build/lin64 -j4 install

${PROJECT_ROOT}libs_lin/64/lib/libz.so:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	cd ${PROJECT_ROOT}extern/zlib/; ./configure \
		--prefix=${PROJECT_ROOT}libs_lin/64\
		--enable-shared
	make -C ./extern/zlib -j4 install

${PROJECT_ROOT}libs_lin/64/lib/libprotobuf.so:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	cmake -B ${PROJECT_ROOT}extern/protobuf/build/lin64dyn\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_STANDARD=14\
		-Dprotobuf_ABSL_PROVIDER='module'\
		-Dprotobuf_BUILD_SHARED_LIBS=ON\
		-Dprotobuf_BUILD_TESTS=OFF\
		${PROJECT_ROOT}extern/protobuf/
	make -C ${PROJECT_ROOT}extern/protobuf/build/lin64 -j4 install

.PHONY: default clean elf_debug elf_release
