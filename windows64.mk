include config.mk
# Define this if you wanna use mingw or something else?
PREFIX			=

EXE				= chiyotatsu64.exe
WIN64			= ${PROJECT_ROOT}libs_win/64/lib/libz.dll.a ${PROJECT_ROOT}libs_win/64/lib/libprotobuf.dll.a

default:
	@echo "It would be better if this was run with the 'clean' argument first"
	@echo "Then use the elf_debug or exe_release with an empty PREFIX="
	@echo "variable to signify you're compiling for linux and is not using"
	@echo "something like mingw"
	@echo "To compile for windows use the arguments"
	@echo "exe_release PREFIX='x86_64-w64-mingw32-'"
	@echo "Project Root Dir: ${PROJECT_ROOT}"

exe_release: ${WIN64} ${PROTOCPP} ${UTILCO} ${UTILCPPO} ${PROTO_O}
	@echo "Linking ${EXE}"
	@${PREFIX}${CPP} ${CFLAGS} -m64\
		-isystem ${PROJECT_ROOT}libs_win/64/include\
		${RELEASE_FLAGS}\
		--static -m64\
		-o ${EXE}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		-L${PROJECT_ROOT}libs_win/64/lib/\
		${ABSL_PROTOBUF_AND_ZLIB}
	@echo "Built target ${EXE}"

%.o: %.c ${WIN64}
	@echo "Building C object ${@}"
	@${PREFIX}${CC} ${CFLAGS} -m64\
		-isystem ${PROJECT_ROOT}libs_win/64/include\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<
	@echo "Built target ${@}"

%.o: %.cpp ${WIN64}
	@echo "Building CXX object ${@}"
	@${PREFIX}${CPP} ${CFLAGS} -m64\
		-isystem ${PROJECT_ROOT}libs_win/64/include\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<
	@echo "Built target ${@}"

%.o: %.cc ${WIN64}
	@echo "Building CXX object ${@}"
	@${PREFIX}${CPP} ${CFLAGS} -m64\
		-isystem ${PROJECT_ROOT}libs_win/64/include\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<
	@echo "Built target ${@}"

${PROJECT_ROOT}src/compiled_proto/%.pb.cc: ${PROJECT_ROOT}proto_files/%.proto\
	${WIN64}
	@if [ -e ${PROJECT_ROOT}libs_win/64/bin/protoc.exe ]; then\
		echo "Building from proto file ${@}";\
		${PROJECT_ROOT}libs_win/64/bin/protoc.exe -I${PROJECT_ROOT}proto_files\
			--cpp_out=${PROJECT_ROOT}src/compiled_proto\
			${notdir $<};\
	else\
		echo "Build failed for target ${@}";\
	fi

${PROJECT_ROOT}libs_win/64/lib/libz.dll.a:
	@if [ ! -d ${PROJECT_ROOT}libs_win/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_win/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_win/64/lib;\
	fi
	@cd ${PROJECT_ROOT}extern/zlib/; ./configure\
		--prefix=${PROJECT_ROOT}libs_win/64
	@make -C ${PROJECT_ROOT}extern/zlib\
		-fwin32/Makefile.gcc -j4\
		PREFIX=${PREFIX} install
	@echo "Built target ${@}"

${PROJECT_ROOT}libs_win/64/lib/libprotobuf.dll.a: ${PROJECT_ROOT}libs_win/64/lib/libabsl_civil_time.dll.a
	@if [ ! -d ${PROJECT_ROOT}libs_win/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_win/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_win/64/lib;\
	fi
	@${PREFIX}cmake -B ${PROJECT_ROOT}extern/protobuf/build/win64\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_win/64\
		-DCMAKE_PREFIX_PATH=${PROJECT_ROOT}libs_win/64\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_FLAGS="-m64"\
		-DCMAKE_CXX_STANDARD=20\
		-Dprotobuf_ABSL_PROVIDER='package'\
		-Dprotobuf_BUILD_TESTS=OFF\
		${PROJECT_ROOT}extern/protobuf/
	@make -C ${PROJECT_ROOT}extern/protobuf/build/win64\
		-j4 install
	@echo "Built target ${@}"

${PROJECT_ROOT}libs_win/64/lib/libabsl_civil_time.dll.a:
	@if [ ! -d ${PROJECT_ROOT}libs_win/64/include ]; then\
		mkdir -p ${PROJECT_ROOT}libs_win/64/include;\
		mkdir -p ${PROJECT_ROOT}libs_win/64/lib;\
	fi
	@${PREFIX}cmake -B ${PROJECT_ROOT}extern/abseil-cpp/build/win64\
		-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}libs_win/64\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_CXX_FLAGS="-m64"\
		-DCMAKE_CXX_STANDARD=20\
		-DABSL_BUILD_TESTING=OFF\
		-DABSL_PROPAGATE_CXX_STD=ON\
		${PROJECT_ROOT}extern/abseil-cpp/
	@${MAKE} -C ${PROJECT_ROOT}extern/abseil-cpp/build/win64 -j4 install
	@echo "Built target $@"

.PHONY: default clean exe_release
