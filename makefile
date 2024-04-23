CC				= gcc
CPP				= g++

CFLAGS			= -Wall -Wpedantic -Wextra
RELEASE_FLAGS	= -O3 -g
DEBUG_FLAGS		= -O0 -g
D_INCL			= -I./libs/include
D_LIBS			= -L./libs/lib
LIBS			= -lz -lprotobuf\
					-labsl_bad_any_cast_impl\
					-labsl_bad_optional_access\
					-labsl_bad_variant_access\
					-labsl_base\
					-labsl_city\
					-labsl_civil_time\
					-labsl_cord\
					-labsl_cord_internal\
					-labsl_cordz_functions\
					-labsl_cordz_handle\
					-labsl_cordz_info\
					-labsl_cordz_sample_token\
					-labsl_crc32c\
					-labsl_crc_cord_state\
					-labsl_crc_cpu_detect\
					-labsl_crc_internal\
					-labsl_debugging_internal\
					-labsl_demangle_internal\
					-labsl_die_if_null\
					-labsl_examine_stack\
					-labsl_exponential_biased\
					-labsl_failure_signal_handler\
					-labsl_flags_commandlineflag\
					-labsl_flags_commandlineflag_internal\
					-labsl_flags_config\
					-labsl_flags_internal\
					-labsl_flags_marshalling\
					-labsl_flags_parse\
					-labsl_flags_private_handle_accessor\
					-labsl_flags_program_name\
					-labsl_flags_reflection\
					-labsl_flags_usage\
					-labsl_flags_usage_internal\
					-labsl_graphcycles_internal\
					-labsl_hash\
					-labsl_hashtablez_sampler\
					-labsl_int128\
					-labsl_kernel_timeout_internal\
					-labsl_leak_check\
					-labsl_log_entry\
					-labsl_log_flags\
					-labsl_log_globals\
					-labsl_log_initialize\
					-labsl_log_internal_check_op\
					-labsl_log_internal_conditions\
					-labsl_log_internal_fnmatch\
					-labsl_log_internal_format\
					-labsl_log_internal_globals\
					-labsl_log_internal_log_sink_set\
					-labsl_log_internal_message\
					-labsl_log_internal_nullguard\
					-labsl_log_internal_proto\
					-labsl_log_severity\
					-labsl_log_sink\
					-labsl_low_level_hash\
					-labsl_malloc_internal\
					-labsl_periodic_sampler\
					-labsl_random_distributions\
					-labsl_random_internal_distribution_test_util\
					-labsl_random_internal_platform\
					-labsl_random_internal_pool_urbg\
					-labsl_random_internal_randen\
					-labsl_random_internal_randen_hwaes\
					-labsl_random_internal_randen_hwaes_impl\
					-labsl_random_internal_randen_slow\
					-labsl_random_internal_seed_material\
					-labsl_random_seed_gen_exception\
					-labsl_random_seed_sequences\
					-labsl_raw_hash_set\
					-labsl_raw_logging_internal\
					-labsl_scoped_set_env\
					-labsl_spinlock_wait\
					-labsl_stacktrace\
					-labsl_status\
					-labsl_statusor\
					-labsl_strerror\
					-labsl_str_format_internal\
					-labsl_strings\
					-labsl_strings_internal\
					-labsl_string_view\
					-labsl_symbolize\
					-labsl_synchronization\
					-labsl_throw_delegate\
					-labsl_time\
					-labsl_time_zone\
					-labsl_vlog_config_internal

CSTD			= --std=gnu11
CPPSTD			= --std=gnu++2a

MAIN			= src/chiyotatsu.cpp
UTILC			= ${wildcard src/utils/*.c}
UTILCPP			= ${wildcard src/utils/*.cpp}
PROTO_FILES		= ${wildcard proto_files/*.proto}
PROTOCPP		= ${patsubst proto_files/%.proto,src/compiled_proto/%.pb.cc,${PROTO_FILES}}

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

clean:
	-@rm -fv src/utils/*.o
	-@rm -fv src/compiled_proto/*.o
	-@rm -fv src/compiled_proto/*.cc
	-@rm -fv src/compiled_proto/*.pb.h
	-@rm -frv libs/lib/*
	-@rm -frv libs/include/*

src/compiled_proto/%.pb.cc: proto_files/%.proto
	-./libs/protoc -I$$(pwd)/proto_files --cpp_out=$$(pwd)/src/compiled_proto\
		${notdir $<}
	-./libs/protoc.exe -I$$(pwd)/proto_files --cpp_out=$$(pwd)/src/compiled_proto\
		${notdir $<}

elf_debug: libs/lib/libz.a libs/lib/libprotobuf.a ${UTILCO} ${UTILCPPO} ${PROTOCPP} ${PROTO_O}
	${CPP} -v ${CFLAGS} ${CPPSTD} ${DEBUG_FLAGS}\
		-o ${ELF} ${MAIN}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		${D_INCL}\
		${D_LIBS}\
		${LIBS}

elf_release: libs/lib/libz.a libs/lib/libprotobuf.a ${UTILCO} ${UTILCPPO} ${PROTOCPP} ${PROTO_O}
	${CPP} -v ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS} --static\
		-o ${ELF} ${MAIN}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		${D_INCL}\
		${D_LIBS}\
		${LIBS}
	strip ${ELF}

exe_release: libs/lib/libz.dll.a libs/lib/libprotobuf.dll.a ${UTILCO} ${UTILCPPO} ${PROTOCPP} ${PROTO_O}
	${PREFIX}${CPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS} --static\
		-o ${EXE} ${MAIN}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		${D_LIBS}\
		${LIBS}
	strip ${EXE}

%.cc: proto_files/${notdir %.proto}
	-@./libs/protoc -I$$(pwd)/proto_files --cpp-out=$$(pwd)/src/compiled_proto\
		${notdir $<}
	-@./libs/protoc.exe -I$$(pwd)/proto_files --cpp-out=$$(pwd)/src/compiled_proto\
		${notdir $<}

%.o: %.c
	${PREFIX}${CC} ${CFLAGS} ${CSTD} ${RELEASE_FLAGS}\
		-o $@\
		-c $<\
		${D_INCL}

%.o: %.cpp
	${PREFIX}${CPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS}\
		-o $@\
		-c $<\
		${D_INCL}

%.o: %.cc
	${PREFIX}${CPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS}\
		-o $@\
		-c $<\
		${D_INCL}

libs/lib/libz.a:
	-@mkdir libs
	-@mkdir libs/include
	-@mkdir libs/lib
	cd ./extern/zlib/; ./configure
	make -C ./extern/zlib -j4
	cp ./extern/zlib/libz.a ./libs/lib
	cp ./extern/zlib/zconf.h ./libs/include
	cp ./extern/zlib/zlib.h ./libs/include

libs/lib/libabsl_base.a:
	-@mkdir libs
	-@mkdir libs/include
	-@mkdir libs/lib
	cmake -B ./extern/abseil-cpp/build/lin \
		-DCMAKE_INSTALL_PREFIX=./extern/abseil-cpp/build/lin \
		./extern/abseil-cpp/
	make -C ./extern/abseil-cpp/build/lin -j4 install
	cp ./extern/abseil-cpp/build/lin/lib/*.a ./libs/lib
	cp -fr ./extern/abseil-cpp/build/lin/include/absl ./libs/include

libs/lib/libprotobuf.a: libs/lib/libabsl_base.a
	-@mkdir libs
	-@mkdir libs/include
	-@mkdir libs/lib
	cmake -B ./extern/protobuf/build/lin \
		-DCMAKE_INSTALL_PREFIX=./extern/protobuf/build/lin ./extern/protobuf/
	make -C ./extern/protobuf/build/lin -j4 libprotobuf protoc install
	cp ./extern/protobuf/build/lin/lib/libprotobuf.a ./libs/lib
	cp -fr ./extern/protobuf/build/lin/include/google ./libs/include
	cp ./extern/protobuf/build/lin/protoc ./libs

libs/lib/libz.dll.a:
	-@mkdir libs
	-@mkdir libs/include
	-@mkdir libs/lib
	cd ./extern/zlib/; ./configure
	make -C ./extern/zlib -fwin32/Makefile.gcc -j4 PREFIX=${PREFIX}
	cp ./extern/zlib/zlib1.dll ./libs/lib
	cp ./extern/zlib/libz.dll.a ./libs/lib
	cp ./extern/zlib/zconf.h ./libs/include
	cp ./extern/zlib/zlib.h ./libs/include

libs/lib/libabsl_base.dll:
	-@mkdir libs
	-@mkdir libs/include
	-@mkdir libs/lib
	${PREFIX}cmake -B ./extern/abseil-cpp/build/win \
		-DCMAKE_INSTALL_PREFIX=./extern/abseil-cpp/build/win \
		./extern/abseil-cpp/
	make -C ./extern/abseil-cpp/build/win -j4 install
	cp ./extern/abseil-cpp/build/win/lib/*.dll ./libs/lib
	cp -fr ./extern/abseil-cpp/build/win/include/absl ./libs/include

libs/lib/libprotobuf.dll.a: libs/lib/libabsl_base.dll
	-@mkdir libs
	-@mkdir libs/include
	-@mkdir libs/lib
	${PREFIX}cmake -B ./extern/protobuf/build/win \
		-DCMAKE_INSTALL_PREFIX=./extern/protobuf/build/win ./extern/protobuf/
	make -C ./extern/protobuf/build/win -j4 libprotobuf protoc install
	cp ./extern/protobuf/build/win/lib/libprotobuf.dll ./libs/lib
	cp ./extern/protobuf/build/win/lib/libprotobuf.dll.a ./libs/lib
	cp -fr ./extern/protobuf/build/win/include/google ./libs/include
	cp ./extern/protobuf/build/win/protoc.exe ./libs


.PHONY: default clean elf_debug elf_release exe_release
