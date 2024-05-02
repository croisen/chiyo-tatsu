include config.mk

ELF				= chiyotatsu32.elf
LIN32			= ${PROJECT_ROOT}libs_lin/32/lib/libz.a ${PROJECT_ROOT}libs_lin/32/lib/libabsl_civil_time.a ${PROJECT_ROOT}libs_lin/32/lib/libprotobuf.a

default:
	@echo "It would be better if this was run with the 'clean' argument first"
	@echo "Then use elf_release"
	@echo "Project Root Dir: ${PROJECT_ROOT}"

elf_release: ${LIN32} ${PROTOCPP} ${UTILCO} ${UTILCPPO} ${PROTO_O}
	@echo "Linking ${ELF}"
	@${CXX} ${CFLAGS} ${CXXSTD}\
		-isystem ${PROJECT_ROOT}libs_lin/32/include\
		${RELEASE_FLAGS}\
		--static -m32\
		-o ${ELF}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		-L${PROJECT_ROOT}libs_lin/32/lib/\
		${ABSL_PROTOBUF_AND_ZLIB}
	@strip ${ELF}
	@echo "Built target ${ELF}"

%.o: %.c
	@echo "Building C object $@"
	@${CC} ${CFLAGS} ${CSTD} -m32\
		-isystem ${PROJECT_ROOT}libs_lin/32/include\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<
	@echo "Built target $@"

%.o: %.cpp ${LIN32}
	@echo "Building CXX object $@"
	@${CXX} ${CFLAGS} ${CXXSTD} -m32\
		-isystem ${PROJECT_ROOT}libs_lin/32/include\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<
	@echo "Built target $@"

%.o: %.cc ${LIN32}
	@echo "Building CXX object $@"
	@${CXX} ${CFLAGS} ${CXXSTD} -m32\
		-isystem ${PROJECT_ROOT}libs_lin/32/include\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<
	@echo "Built target $@"

${PROJECT_ROOT}src/compiled_proto/%.pb.cc: ${PROJECT_ROOT}proto_files/%.proto
	@if [ -e ${PROJECT_ROOT}libs_lin/32/bin/protoc ]; then\
		echo "Building from proto file $@";\
		${PROJECT_ROOT}libs_lin/32/bin/protoc -I${PROJECT_ROOT}proto_files\
			--cpp_out=${PROJECT_ROOT}src/compiled_proto\
			${notdir $<};\
		echo "Built target $@";\
	else\
		echo "Build failed for target $@";\
	fi

${PROJECT_ROOT}libs_lin/32/lib/libz.a:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/32/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/32/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/32/lib;\
	fi
	@cd ${PROJECT_ROOT}extern/zlib/; CFLAGS=-m32 ./configure\
		--prefix=${PROJECT_ROOT}libs_lin/32
	@${MAKE} -C ${PROJECT_ROOT}extern/zlib -j4 install
	@echo "Built target $@"

${PROJECT_ROOT}libs_lin/32/lib/libprotobuf.a: ${PROJECT_ROOT}libs_lin/32/lib/libabsl_civil_time.a
	@if [ ! -d ${PROJECT_ROOT}libs_lin/32/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/32/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/32/lib;\
	fi
	@cmake -B ${PROJECT_ROOT}extern/protobuf/build/lin32\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/32\
		-DCMAKE_PREFIX_PATH=${PROJECT_ROOT}libs_lin/32\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_FLAGS="-m32"\
		-DCMAKE_CXX_STANDARD=20\
		-Dprotobuf_ABSL_PROVIDER='package'\
		-Dprotobuf_BUILD_TESTS=OFF\
		${PROJECT_ROOT}extern/protobuf/
	@${MAKE} -C ${PROJECT_ROOT}extern/protobuf/build/lin32 -j4 install
	@echo "Built target $@"

${PROJECT_ROOT}libs_lin/32/lib/libabsl_civil_time.a:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/32/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/32/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/32/lib;\
	fi
	@cmake -B ${PROJECT_ROOT}extern/abseil-cpp/build/lin32\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/32\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_FLAGS="-m32"\
		-DCMAKE_CXX_STANDARD=20\
		-DABSL_BUILD_TESTING=OFF\
		-DABSL_PROPAGATE_CXX_STD=ON\
		${PROJECT_ROOT}extern/abseil-cpp/
	@${MAKE} -C ${PROJECT_ROOT}extern/abseil-cpp/build/lin32 -j4 install
	@echo "Built target $@"

.PHONY: default clean elf_release
