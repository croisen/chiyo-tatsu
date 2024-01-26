CC				= cc
CFLAGS			= -Wall -Wextra -Wpedantic -Werror
NOWARN			= -Wno-implicit-fallthrough
OPTS			= -O3 -g
LIBS			= -lz

EXE				= chiyotatsu.exe
MAIN			= chiyotatsu.c

COMPONENTS_C	= ${wildcard others/*.c}
COMPONENTS_O	= ${patsubst %.c,%.o,${COMPONENTS_C}}

VALGRIND		:= ${shell command -v valgrind 2>/dev/null}
VALGRIND_OPTS	= --leak-check=full --show-leak-kinds=all --track-origins=yes


.PHONY: all clean test

all: clean ${EXE}

${EXE}: ${COMPONENTS_O}
	${CC} ${CFLAGS} ${OPTS} -o ${EXE} ${MAIN} ${COMPONENTS_O} ${LIBS} ${NOWARN}

${COMPONENTS_O}:
	${CC} ${CFLAGS} ${OPTS} -o $@ -c ${patsubst %.o,%.c,$@} ${NOWARN}

clean:
	rm -f ${EXE}
	rm -f ${COMPONENTS_O}

test: clean ${EXE}
ifdef VALGRIND
	${VALGRIND} ${VALGRIND_OPTS} ./${EXE}
else
	./${EXE}
endif
