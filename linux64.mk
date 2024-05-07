include config.mk

ELF				= chiyotatsu64.elf
LIN64			= ${PROJECT_ROOT}libs_lin/64/lib/libz.a\
				  ${PROJECT_ROOT}libs_lin/64/lib/libabsl_civil_time.a\
				  ${PROJECT_ROOT}libs_lin/64/lib/libprotobuf.a\
				  ${PROJECT_ROOT}libs_lin/64/lib/libzippp.a\
				  ${PROJECT_ROOT}libs_lin/64/lib/libzip.a\
				  ${PROJECT_ROOT}libs_lin/64/lib/libjsoncpp.a

default:
	@echo "It would be better if this was run with the 'clean' argument first"
	@echo "Then use the elf_release"
	@echo "Project Root Dir: ${PROJECT_ROOT}"

elf_release: ${LIN64} ${PROTOCPP} ${UTILCO} ${UTILCPPO} ${PROTO_O}
	@echo "Linking executable ${ELF}"
	@${CXX} ${CFLAGS} ${CXXSTD}\
		-isystem ${PROJECT_ROOT}libs_lin/64/include\
		${RELEASE_FLAGS}\
		-UPROTOBUF_USE_DLLS\
		--static -m64\
		-o ${ELF}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		-L${PROJECT_ROOT}libs_lin/64/lib/\
		${ABSL_PROTOBUF_AND_ZLIB}
	@strip ${ELF}
	@echo "Built target ${ELF}"

%.o: %.c ${LIN64}
	@echo "Building C object $@"
	@${CC} ${CFLAGS} ${CSTD} -m64\
		-isystem ${PROJECT_ROOT}libs_lin/64/include\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<
	@echo "Built target $@"

%.o: %.cpp ${LIN64}
	@echo "Building CXX object $@"
	@${CXX} ${CFLAGS} ${CXXSTD} -m64\
		-isystem ${PROJECT_ROOT}libs_lin/64/include\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<
	@echo "Built target $@"

%.o: %.cc ${LIN64}
	@echo "Building CXX object $@"
	@${CXX} ${CFLAGS} ${CXXSTD} -m64\
		-isystem ${PROJECT_ROOT}libs_lin/64/include\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<
	@echo "Built target $@"

${PROJECT_ROOT}src/compiled_proto/%.pb.cc: ${PROJECT_ROOT}proto_files/%.proto\
	${LIN64}
	@if [ -e ${PROJECT_ROOT}libs_lin/64/bin/protoc ]; then\
		echo "Building from proto file $@";\
		${PROJECT_ROOT}libs_lin/64/bin/protoc -I${PROJECT_ROOT}proto_files\
			--cpp_out=${PROJECT_ROOT}src/compiled_proto\
			${notdir $<};\
		echo "Built target $@";\
	else\
		echo "Build failed for target $@";\
	fi

${PROJECT_ROOT}libs_lin/64/lib/libz.a:
	@cd ${PROJECT_ROOT}extern/zlib/; ./configure\
		--prefix=${PROJECT_ROOT}libs_lin/64
	@${MAKE} -C ${PROJECT_ROOT}extern/zlib install
	@echo "Built target $@"

${PROJECT_ROOT}libs_lin/64/lib/libprotobuf.a: ${PROJECT_ROOT}libs_lin/64/lib/libabsl_civil_time.a
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	@cmake -B ${PROJECT_ROOT}extern/protobuf/build/lin64\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_PREFIX_PATH=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_FLAGS="-m64"\
		-DCMAKE_CXX_STANDARD=20\
		-Dprotobuf_ABSL_PROVIDER='package'\
		-Dprotobuf_BUILD_TESTS=OFF\
		${PROJECT_ROOT}extern/protobuf/
	@${MAKE} -C ${PROJECT_ROOT}extern/protobuf/build/lin64 install
	@echo "Built target $@"

${PROJECT_ROOT}libs_lin/64/lib/libabsl_civil_time.a:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	@cmake -B ${PROJECT_ROOT}extern/abseil-cpp/build/lin64\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_FLAGS="-m64"\
		-DCMAKE_CXX_STANDARD=20\
		-DABSL_BUILD_TESTING=OFF\
		-DABSL_PROPAGATE_CXX_STD=ON\
		${PROJECT_ROOT}extern/abseil-cpp/
	@${MAKE} -C ${PROJECT_ROOT}extern/abseil-cpp/build/lin64 install
	@echo "Built target $@"

${PROJECT_ROOT}libs_lin/64/lib/libjsoncpp.a:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	@cmake -B ${PROJECT_ROOT}extern/jsoncpp/build/lin64dyn\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_PREFIX_PATH=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_FLAGS="-m64"\
		-DBUILD_SHARED_LIBS=OFF\
		${PROJECT_ROOT}extern/jsoncpp/
	@${MAKE} -C ${PROJECT_ROOT}extern/jsoncpp/build/lin64dyn install
	@echo "Built target $@"

${PROJECT_ROOT}libs_lin/64/lib/libzippp.a: ${PROJECT_ROOT}libs_lin/64/lib/libzip.a
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	@cmake -B ${PROJECT_ROOT}extern/zippp/build/lin64\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_PREFIX_PATH=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_FLAGS="-m64"\
		-DCMAKE_CXX_STANDARD=20\
		-DBUILD_SHARED_LIBS=OFF\
		${PROJECT_ROOT}extern/zippp/
	@${MAKE} -C ${PROJECT_ROOT}extern/zippp/build/lin64 install
	@mv ${PROJECT_ROOT}libs_lin/64/lib/libzippp_static.a \
		${PROJECT_ROOT}libs_lin/64/lib/libzippp.a
	@echo "Built target $@"

${PROJECT_ROOT}libs_lin/64/lib/libzip.a: ${PROJECT_ROOT}libs_lin/64/lib/libz.a
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	@cmake -B ${PROJECT_ROOT}extern/zip/build/lin64dyn\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_PREFIX_PATH=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_FLAGS="-m64"\
		-DCMAKE_CXX_STANDARD=20\
		-DBUILD_SHARED_LIBS=OFF\
		-DENABLE_COMMONCRYPTO=OFF\
		-DENABLE_GNUTLS=OFF\
		-DENABLE_MBEDTLS=OFF\
		-DENABLE_OPENSSL=OFF\
		-DENABLE_BZIP2=OFF\
LIN32			= ${PROJECT_ROOT}libs_lin/32/lib/libz.a ${PROJECT_ROOT}libs_lin/32/lib/libabsl_civil_time.a ${PROJECT_ROOT}libs_lin/32/lib/libprotobuf.a
		-DENABLE_LZMA=OFF\
		-DENABLE_ZSTD=OFF\
		${PROJECT_ROOT}extern/zip/
	@${MAKE} -C ${PROJECT_ROOT}extern/zip/build/lin64dyn install
	@echo "Built target $@"

.PHONY: default clean elf_debug elf_release
