include config.mk

ELF				= chiyotatsu64.elf

LIN64DYN		= ${PROJECT_ROOT}libs_lin/64/lib/libz.so\
				  ${PROJECT_ROOT}libs_lin/64/lib/libabsl_civil_time.so\
				  ${PROJECT_ROOT}libs_lin/64/lib/libprotobuf.so\
				  ${PROJECT_ROOT}libs_lin/64/lib/libzip.so\
				  ${PROJECT_ROOT}libs_lin/64/lib/libjsoncpp.so

default:
	@echo "It would be better if this was run with the 'clean' argument first"
	@echo "Then use the elf_debug"
	@echo "Project Root Dir: ${PROJECT_ROOT}"

elf_debug: ${LIN64DYN} ${PROTOCPP} ${UTILCO} ${UTILCPPO} ${PROTO_O}
	@echo "Linking executable ${ELF}"
	@${CXX} ${CFLAGS} ${CXXSTD}\
		-isystem ${PROJECT_ROOT}libs_lin/64/include\
		${DEBUG_FLAGS}\
		-m64\
		-o ${ELF}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		-L${PROJECT_ROOT}libs_lin/64/lib/\
		${ABSL_PROTOBUF_AND_ZLIB}
	@echo "Built target ${ELF}"

%.o: %.c ${LIN64DYN}
	@echo "Building C object $@"
	@${CC} ${CFLAGS} ${CSTD} -m64\
		-isystem ${PROJECT_ROOT}libs_lin/64/include\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<
	@echo "Built target $@"

%.o: %.cpp ${LIN64DYN}
	@echo "Building CXX object $@"
	@${CXX} ${CFLAGS} ${CXXSTD} -m64\
		-isystem ${PROJECT_ROOT}libs_lin/64/include\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<
	@echo "Built target $@"

%.o: %.cc ${LIN64DYN}
	@echo "Building CXX object $@"
	@${CXX} ${CFLAGS} ${CXXSTD} -m64\
		-isystem ${PROJECT_ROOT}libs_lin/64/include\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<
	@echo "Built target $@"

${PROJECT_ROOT}src/compiled_proto/%.pb.cc: ${PROJECT_ROOT}proto_files/%.proto\
	${LIN64DYN}
	@if [ -e ${PROJECT_ROOT}libs_lin/64/bin/protoc ]; then\
		echo "Building from proto file $@";\
		${PROJECT_ROOT}libs_lin/64/bin/protoc -I${PROJECT_ROOT}proto_files\
			--cpp_out=${PROJECT_ROOT}src/compiled_proto\
			${notdir $<};\
		echo "Built target $@";\
	else\
		echo "Build failed for target $@";\
	fi

${PROJECT_ROOT}libs_lin/64/lib/libz.so:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	@cd ${PROJECT_ROOT}extern/zlib/; ./configure \
		--prefix=${PROJECT_ROOT}libs_lin/64\
		--enable-shared
	@${MAKE} -C ./extern/zlib install
	@echo "Built target $@"

${PROJECT_ROOT}libs_lin/64/lib/libprotobuf.so: ${PROJECT_ROOT}libs_lin/64/lib/libabsl_civil_time.so
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	@cmake -B ${PROJECT_ROOT}extern/protobuf/build/lin64dyn\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_PREFIX_PATH=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_FLAGS="-m64"\
		-DCMAKE_CXX_STANDARD=20\
		-Dprotobuf_ABSL_PROVIDER='package'\
		-Dprotobuf_BUILD_SHARED_LIBS=ON\
		-Dprotobuf_BUILD_TESTS=OFF\
		${PROJECT_ROOT}extern/protobuf/
	@${MAKE} -C ${PROJECT_ROOT}extern/protobuf/build/lin64dyn install
	@echo "Built target $@"

${PROJECT_ROOT}libs_lin/64/lib/libabsl_civil_time.so:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	@cmake -B ${PROJECT_ROOT}extern/abseil-cpp/build/lin64dyn\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/64\
		-DBUILD_SHARED_LIBS=ON\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_FLAGS="-m64"\
		-DCMAKE_CXX_STANDARD=20\
		-DABSL_BUILD_TESTING=OFF\
		-DABSL_PROPAGATE_CXX_STD=ON\
		${PROJECT_ROOT}extern/abseil-cpp/
	@${MAKE} -C ${PROJECT_ROOT}extern/abseil-cpp/build/lin64dyn install
	@echo "Built target $@"

${PROJECT_ROOT}libs_lin/64/lib/libjsoncpp.so:
	@if [ ! -d ${PROJECT_ROOT}libs_lin/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_lin/64/lib;\
	fi
	@cmake -B ${PROJECT_ROOT}extern/jsoncpp/build/lin64dyn\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_PREFIX_PATH=${PROJECT_ROOT}libs_lin/64\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_FLAGS="-m64"\
		-DBUILD_SHARED_LIBS=ON\
		${PROJECT_ROOT}extern/jsoncpp/
	@${MAKE} -C ${PROJECT_ROOT}extern/jsoncpp/build/lin64dyn install
	@echo "Built target $@"

${PROJECT_ROOT}libs_lin/64/lib/libzip.so: ${PROJECT_ROOT}libs_lin/64/lib/libz.so
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
		-DBUILD_SHARED_LIBS=ON\
		${PROJECT_ROOT}extern/zip/
	@${MAKE} -C ${PROJECT_ROOT}extern/zip/build/lin64dyn install
	@echo "Built target $@"

.PHONY: default clean elf_debug elf_debug
