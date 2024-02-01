CC				= cc
CFLAGS			= -Wall -Wextra -Wpedantic -Werror
NOWARN			= -Wno-implicit-fallthrough
OPTS_DEBUG		= -Og -g -D'__BCROI_PARSER_DEBUG' -D'__CCROI_CHIYO_TATSU_DEBUG'
OPTS_RELEASE	= -O3 -s --static
LIBS			= -lz -lprotobuf
LIBS_DIR		= -L./built_libs -I./other_includes

EXE				= chiyotatsu.exe
MAIN			= chiyotatsu.c

COMPONENTS_C	= ${wildcard own_utils/*.c}
COMPONENTS_O	= ${patsubst %.c,%.o,${COMPONENTS_C}}

OTHER_LIBS		= built_libs/libz.a built_libs/libprotobuf.a

VALGRIND		:= ${shell command -v valgrind 2>/dev/null}
VALGRIND_OPTS	= --leak-check=full --show-leak-kinds=all --track-origins=yes


.PHONY: all clean test debug other_libs
all: clean ${EXE}

define rebuild_other_libs
test -e ${1} || ${MAKE} ${1}

endef

other_libs:
	${foreach lib,${OTHER_LIBS},\
		${call rebuild_other_libs,${lib}}\
	}

debug: clean ${COMPONENTS_O} other_libs
	${CC} ${CFLAGS} ${NOWARN} ${OPTS_DEBUG} -o ${EXE} ${MAIN}\
		${COMPONENTS_O}\
		${LIBS} ${LIBS_DIR}

${EXE}: clean ${COMPONENTS_O} other_libs
	${CC} ${CFLAGS} ${NOWARN} ${OPTS_RELEASE} -o $@ ${MAIN}\
		${COMPONENTS_O}\
		${LIBS} ${LIBS_DIR}
		

${COMPONENTS_O}:
	${CC} ${CFLAGS} ${OPTS} -o $@ -c ${patsubst %.o,%.c,$@} ${NOWARN}

protobuf-c:
	mkdir -p other_includes/
	cd other_libs/$@; ./autogen.sh && ./configure
	$(MAKE) -C other_libs/$@
	cp other_libs/$@/$@/.libs/lib$@.a  built_libs/libprotobuf.a
	cp other_libs/$@/$@/.libs/lib$@.so built_libs/libprotobuf.so
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
	rm -f ${COMPONENTS_O}

test: clean debug
ifdef VALGRIND
	${VALGRIND} ${VALGRIND_OPTS} ./${EXE} -h
else
	./${EXE} -h
endif

built_libs/libz.a: zlib
built_libs/libprotobuf.a: protobuf-c
