CC				= cc
MINGWCC			= x86_64-w64-mingw32-gcc
CFLAGS			= -Wall -Wextra -Wpedantic -Werror
NOWARN			= -Wno-implicit-fallthrough
OPTS_DEBUG		= -Og -g -D'___BREAD_PARSER_DEBUG' -D'___CHIYO_TATSU_DEBUG' -D'___MEMTRACKER_DEBUG'
OPTS_RELEASE	= -O3 -s --static
LIBS			= -lz
#LIBS			= -lz -lprotobuf-c
LIBS_DIR		= -L./built_libs -I./other_includes

EXE				= chiyotatsu.exe
ELF				= chiyotatsu.elf
MAIN			= chiyotatsu.c

COMPONENTS_C	= ${wildcard own_utils/*.c}
COMPONENTS_O	= ${patsubst %.c,%.o,${COMPONENTS_C}}

OTHER_LIBS		= built_libs/libz.a
#OTHER_LIBS		= built_libs/libz.a built_libs/libprotobuf-c.a

debug: clean ${patsubst %,%_DEBUG,${COMPONENTS_O}} ${OTHER_LIBS}
	${CC} ${CFLAGS} ${NOWARN} ${OPTS_DEBUG}\
		-o ${EXE} ${MAIN}\
		${COMPONENTS_O}\
		${LIBS} ${LIBS_DIR}

${ELF}: ${COMPONENTS_O} ${OTHER_LIBS}
	${CC} ${CFLAGS} ${NOWARN} ${OPTS_RELEASE} -o $@ ${MAIN}\
		${COMPONENTS_O}\
		${LIBS} ${LIBS_DIR}

${EXE}: ${COMPONENTS_O} ${OTHER_LIBS}
	${MINGWCC} ${CFLAGS} ${NOWARN} ${OPTS_RELEASE} -o $@ ${MAIN}\
		${COMPONENTS_O}\
		${LIBS} ${LIBS_DIR}

${COMPONENTS_O}:
	${CC} ${CFLAGS} ${OPTS} -o $@ -c ${patsubst %.o,%.c,$@} ${NOWARN}

${patsubst %,%_DEBUG,${COMPONENTS_O}}:
	${CC} ${CFLAGS} ${OPTS_DEBUG} -o ${patsubst %_DEBUG,%,$@}\
		-c ${patsubst %.o_DEBUG,%.c,$@} ${NOWARN}

protobuf-c:
	mkdir -p other_includes/
	cd other_libs/$@; ./autogen.sh && ./configure
	$(MAKE) -C other_libs/$@
	cp other_libs/$@/$@/.libs/lib$@.a  built_libs/
	cp other_libs/$@/$@/.libs/lib$@.so built_libs/
	cp other_libs/$@/$@/$@.h           other_includes/

zlib:
	mkdir -p other_includes/
	mkdir -p built_libs/remnants/$@
	cd built_libs/remnants/$@; cmake ../../../other_libs/$@
	$(MAKE) -C built_libs/remnants/$@
	cp built_libs/remnants/$@/libz.so built_libs/
	cp built_libs/remnants/$@/libz.a  built_libs/
	cp built_libs/remnants/$@/zconf.h other_includes/
	cp other_libs/$@/zlib.h           other_includes/

clean:
	rm -f ${EXE}
	rm -f ${ELF}
	rm -f ${OTHER_LIBS}
	rm -f ${COMPONENTS_O}

all: clean ${ELF} ${EXE}
elf: clean ${ELF}
exe: clean ${EXE}

built_libs/libz.a: zlib
built_libs/libprotobuf-c.a: protobuf-c

.PHONY: all clean test debug other_libs
