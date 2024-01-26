CC				= cc
CFLAGS			= -Wall -Wextra -Wpedantic -Werror
OPTS			= -O3 -g
LIBS			= -lz

EXE				= chiyotatsu.exe
MAIN			= chiyotatsu.c

COMPONENTS_C	= ${wildcard others/*.c}
COMPONENTS_O	= ${patsubst %.c,%.o,${COMPONENTS_C}}


.PHONY: all clean

all: clean ${EXE}

${EXE}: ${COMPONENTS_O}
	${CC} ${CFLAGS} ${OPTS} -o ${EXE} ${MAIN} ${COMPONENTS_O} ${LIBS}

${COMPONENTS_O}:
	${CC} ${CFLAGS} ${OPTS} -o $@ -c ${patsubst %.o,%.c,$@}

clean:
	rm -f ${EXE}
	rm -f ${COMPONENTS_O}
