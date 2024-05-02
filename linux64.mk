PROJECT_ROOT	= ${strip ${dir ${realpath ${lastword ${MAKEFILE_LIST}}}}}

CC				= gcc
CXX				= g++
#-Wall -Wpedantic -Wextra
CFLAGS			=
CSTD			= --std=c2x
CXXSTD			= --std=c++20
RELEASE_FLAGS	= -O3 -g
DEBUG_FLAGS		= -O0 -g
LIBS_USED		= protobuf zlib

MAIN			= ${PROJECT_ROOT}src/chiyotatsu.cpp
UTILC			= ${wildcard ${PROJECT_ROOT}src/utils/*.c}
UTILCPP			= ${MAIN} ${wildcard ${PROJECT_ROOT}src/utils/*.cpp}
PROTO_FILES		= ${wildcard ${PROJECT_ROOT}proto_files/*.proto}
PROTOCPP		= ${patsubst ${PROJECT_ROOT}proto_files/%.proto,${PROJECT_ROOT}src/compiled_proto/%.pb.cc,${PROTO_FILES}}

UTILCO			= ${patsubst %.c,%.o,${UTILC}}
UTILCPPO		= ${patsubst %.cpp,%.o,${UTILCPP}}
PROTO_O			= ${patsubst %.cc,%.o,${PROTOCPP}}

ELF				= chiyotatsu64.elf
LIN64			= ${PROJECT_ROOT}libs_lin/64/lib/libz.a ${PROJECT_ROOT}libs_lin/64/lib/libabsl_civil_time.a ${PROJECT_ROOT}libs_lin/64/lib/libprotobuf.a
LIN64DYN		= ${PROJECT_ROOT}libs_lin/64/lib/libz.so ${PROJECT_ROOT}libs_lin/64/lib/libabsl_civil_time.so ${PROJECT_ROOT}libs_lin/64/lib/libprotobuf.so

# This was one hell of a solution (for static linking)
# Used a shell script to search for the symbols missing
# as dictated by g++ (took 3 hours...)
# I sure hope this would work in gh workflow
ABSL_PROTOBUF_AND_ZLIB=\
					   -lprotobuf\
					   -labsl_statusor\
					   -labsl_cord\
					   -labsl_cordz_functions\
					   -labsl_cordz_info\
					   -labsl_cordz_handle\
					   -labsl_cord_internal\
					   -labsl_crc_cord_state\
					   -labsl_crc32c\
					   -labsl_crc_internal\
					   -labsl_exponential_biased\
					   -labsl_raw_hash_set\
					   -labsl_synchronization\
					   -labsl_strings\
					   -labsl_log_internal_message\
					   -labsl_raw_logging_internal\
					   -labsl_log_internal_check_op\
					   -labsl_log_internal_conditions\
					   -labsl_log_internal_log_sink_set\
					   -labsl_log_sink\
					   -labsl_log_internal_format\
					   -labsl_log_flags\
					   -labsl_log_globals\
					   -labsl_strings_internal\
					   -labsl_str_format_internal\
					   -labsl_spinlock_wait\
					   -labsl_throw_delegate\
					   -labsl_flags_reflection\
					   -labsl_examine_stack\
					   -labsl_stacktrace\
					   -labsl_hash\
					   -labsl_city\
					   -labsl_low_level_hash\
					   -labsl_kernel_timeout_internal\
					   -labsl_time\
					   -labsl_time_zone\
					   -labsl_int128\
					   -labsl_malloc_internal\
					   -labsl_log_internal_proto\
					   -labsl_log_internal_globals\
					   -labsl_status\
					   -labsl_strerror\
					   -labsl_symbolize\
					   -labsl_debugging_internal\
					   -labsl_demangle_internal\
					   -labsl_log_internal_nullguard\
					   -labsl_base\
					   -lutf8_validity\
					   -lutf8_range\
					   -lz

default:
	@echo "It would be better if this was run with the 'clean' argument first"
	@echo "Then use the elf_debug or elf_release"
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

elf_debug: ${LIN64DYN} ${PROTOCPP} ${UTILCO} ${UTILCPPO} ${PROTO_O}
	@echo "Linking executable ${ELF}"
	@${CXX} ${CFLAGS} ${CXXSTD}\
		$$(\
			PKG_CONFIG_PATH=${PROJECT_ROOT}libs_lin/64/lib/pkgconfig\
			pkg-config --cflags ${LIBS_USED}\
		)\
		${DEBUG_FLAGS}\
		-m64\
		-o ${ELF}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		-L${PROJECT_ROOT}libs_lin/64/lib/\
		${ABSL_PROTOBUF_AND_ZLIB}
	@echo "Built target ${ELF}"

elf_release: ${LIN64} ${PROTOCPP} ${UTILCO} ${UTILCPPO} ${PROTO_O}
	@echo "Linking executable ${ELF}"
	@${CXX} ${CFLAGS} ${CXXSTD}\
		$$(\
			PKG_CONFIG_PATH=${PROJECT_ROOT}libs_lin/64/lib/pkgconfig\
			pkg-config --cflags ${LIBS_USED}\
		)\
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
	@${CC} ${CFLAGS} ${CSTD}\
		${INCL}\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<\
		$$(\
			PKG_CONFIG_PATH=${PROJECT_ROOT}libs_lin/64/lib/pkgconfig\
			pkg-config --cflags ${LIBS_USED}\
		)
	@echo "Built target $@"

%.o: %.cpp ${LIN64}
	@echo "Building CXX object $@"
	@${CXX} ${CFLAGS} ${CXXSTD}\
		${INCL}\
		${RELEASE_FLAGS}\
		-o $@\
		-c $<\
		$$(\
			PKG_CONFIG_PATH=${PROJECT_ROOT}libs_lin/64/lib/pkgconfig\
			pkg-config --cflags ${LIBS_USED}\
		)
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
		-DABSL_PROPAGATE_CXX_STD=ON\
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
		-DCMAKE_CXX_STANDARD=20\
		-Dprotobuf_ABSL_PROVIDER='package'\
		-Dprotobuf_BUILD_SHARED_LIBS=ON\
		-DABSL_PROPAGATE_CXX_STD=ON\
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

.PHONY: default clean elf_debug elf_release
