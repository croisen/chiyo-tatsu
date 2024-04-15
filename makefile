CC				= cc
CFLAGS			= -Wall -Wextra -Wpedantic -Werror
NOWARN			= -Wno-implicit-fallthrough
OPTS_DEBUG		= -Og -g
OPTS_RELEASE	= -O3 -s --static
LIBS			= -lz -lprotobuf-c

ELF				= chiyotatsu.elf
MAIN			= chiyotatsu.c

COMPONENTS_C	= ${wildcard own_utils/*.c}
COMPONENTS_O	= ${patsubst %.c,%.o,${COMPONENTS_C}}


debug: clean ${OTHER_LIBS} ${patsubst %,%_DEBUG,${COMPONENTS_O}}
	${CC} ${CFLAGS} ${NOWARN} ${OPTS_DEBUG}\
		-o ${ELF} ${MAIN}\
		${COMPONENTS_O}\
		${LIBS} ${LIBS_DIR}

${ELF}: ${OTHER_LIBS} ${COMPONENTS_O}
	${CC} ${CFLAGS} ${NOWARN} ${OPTS_RELEASE}\
		-o $@ ${MAIN}\
		${COMPONENTS_O}\
		${LIBS} ${LIBS_DIR}

${COMPONENTS_O}:
	${CC} ${CFLAGS} ${OPTS} -o $@ -c ${patsubst %.o,%.c,$@} ${NOWARN} \
		${LIBS} ${LIBS_DIR}

${patsubst %,%_DEBUG,${COMPONENTS_O}}:
	${CC} ${CFLAGS} ${OPTS_DEBUG} -o ${patsubst %_DEBUG,%,$@}\
		-c ${patsubst %.o_DEBUG,%.c,$@} ${NOWARN}

clean:
	rm -f ${ELF}
	rm -f ${COMPONENTS_O}

all: clean ${ELF}
elf: clean ${ELF}

.PHONY: all clean test debug
