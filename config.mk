CC				= gcc
CPP				= g++
MINGWCC			= x86_64-w64-mingw32-gcc
MINGWCPP		= x86_64-w64-mingw32-g++

CFLAGS			= -Wall -Wpedantic -Wextra
NO_WARN			= -Wno-gnu-zero-variadic-macro-arguments
RELEASE_FLAGS	= -O3 -g
DEBUG_FLAGS		= -O0 -g
LIBS			= -lz -lprotobuf -labsl_log_internal_check_op \
				  -labsl_log_internal_message -labsl_raw_logging_internal \
				  -labsl_spinlock_wait

CSTD			= --std=gnu11
CPPSTD			= --std=gnu++2a

MAIN			= src/chiyotatsu.cpp
UTILC			= ${wildcard src/utils/*.c}
UTILCPP			= ${wildcard src/utils/*.cpp}
PROTOCPP		= ${wildcard src/compiled_proto/*.pb.cc}

UTILCO			= ${patsubst %.c,%.o,${UTILC}}
UTILCPPO		= ${patsubst %.cpp,%.o,${UTILCPP}}
PROTO_O			= ${patsubst %.cc,%.o,${PROTOCPP}}
