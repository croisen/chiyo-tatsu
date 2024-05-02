PROJECT_ROOT	= ${strip ${dir ${realpath ${lastword ${MAKEFILE_LIST}}}}}

CC				= gcc
CXX				= g++
CFLAGS			= -Wall -Wpedantic -Wextra
CSTD			= --std=c2x
CXXSTD			= --std=c++20
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

clean:
	@echo   "Removing ${PROJECT_ROOT}src/*.o"
	-@rm -f  ${PROJECT_ROOT}src/*.o
	@echo   "Removing ${PROJECT_ROOT}src/utils/*.o"
	-@rm -f  ${PROJECT_ROOT}src/utils/*.o
	@echo    "Removing ${PROJECT_ROOT}src/compiled_proto/*.o"
	-@rm -f  ${PROJECT_ROOT}src/compiled_proto/*.o
	@echo    "Removing ${PROJECT_ROOT}src/compiled_proto/*.cc"
	-@rm -f  ${PROJECT_ROOT}src/compiled_proto/*.cc
	@echo    "Removing ${PROJECT_ROOT}src/compiled_proto/*.pb.h"
	-@rm -f  ${PROJECT_ROOT}src/compiled_proto/*.pb.h
