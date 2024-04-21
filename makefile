CC				= gcc
CPP				= g++
MINGWCC			= x86_64-w64-mingw32-gcc-win32
MINGWCPP		= x86_64-w64-mingw32-g++-win32

CSTD			= --std=gnu11
CPPSTD			= --std=gnu++2a

CFLAGS			= -Wall -Wpedantic -Wextra
NO_WARN			= -Wno-gnu-zero-variadic-macro-arguments
RELEASE_FLAGS	= -O3 -g
DEBUG_FLAGS		= -O0 -g
LIBS			= -lz -lprotobuf -labsl_log_internal_check_op \
				  -labsl_log_internal_message -labsl_raw_logging_internal \
				  -labsl_spinlock_wait

MAIN			= src/chiyotatsu.cpp
ELF				= chiyotatsu.elf
EXE				= chiyotatsu.exe

UTILC			= ${wildcard src/utils/*.c}
UTILCPP			= ${wildcard src/utils/*.cpp}
PROTOCPP		= ${wildcard src/compiled_proto/*.pb.cc}


LIN_UTILCO		= ${patsubst %.c,%.o,${UTILC}}
LIN_UTILCPPO	= ${patsubst %.cpp,%.o,${UTILCPP}}
LIN_PROTO_O		= ${patsubst %.cc,%.o,${PROTOCPP}}
WIN_UTILCO		= ${patsubst %.c,%.o,${UTILC}}
WIN_UTILCPPO	= ${patsubst %.cpp,%.o,${UTILCPP}}
WIN_PROTO_O		= ${patsubst %.cc,%.o,${PROTOCPP}}

default: elf_debug

clean:
	-@rm -fv src/utils/*.o
	-@rm -fv src/compiled_proto/*.o

elf_debug: ${LIN_UTILCO} ${LIN_UTILCPPO} ${LIN_PROTO_O}
	${CPP} ${CFLAGS} ${CPPSTD} ${DEBUG_FLAGS} -o ${ELF} ${MAIN}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		${LIBS}

elf_release: clean ${LIN_UTILCO} ${LIN_UTILCPPO} ${LIN_PROTO_O}
	${CPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS} --static -o ${ELF} ${MAIN}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		${LIBS}
	strip ${ELF}

exe_release: clean ${WIN_UTILCO} ${WIN_UTILCPPO} ${WIN_PROTO_O}
	${MINGWCPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS} --static -o ${EXE} ${MAIN}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		${LIBS}

${LIN_UTILCO}:
	${CC} ${CFLAGS} ${CSTD} ${RELEASE_FLAGS}\
		${NO_WARN}\
		-o $@\
		-c ${patsubst %.o,%.c,$@}

${LIN_UTILCPPO}:
	${CPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS}\
		${NO_WARN}\
		-o $@\
		-c ${patsubst %.o,%.cpp,$@}

${LIN_PROTO_O}:
	${CPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS}\
		${NO_WARN}\
		-o $@\
		-c ${patsubst %.o,%.cc,$@}

${WIN_UTILCO}:
	${MINGWCC} ${CFLAGS} ${CSTD} ${RELEASE_FLAGS}\
		${NO_WARN}\
		-o $@\
		-c ${patsubst %.o,%.c,$@}

${WIN_UTILCPPO}:
	${MINGWCPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS}\
		${NO_WARN}\
		-o $@\
		-c ${patsubst %.o,%.cpp,$@}

${WIN_PROTO_O}:
	${MINGWCPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS}\
		${NO_WARN}\
		-o $@\
		-c ${patsubst %.o,%.cc,$@}

.PHONY: default clean elf_debug elf_release exe_release\
	${LIN_UTILCO} ${LIN_UTILCPPO}\
	${WIN_UTILCO} ${WIN_UTILCPPO}
