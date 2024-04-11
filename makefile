CC				= cc
CFLAGS			= -Wall -Wextra -Wpedantic -Werror
NOWARN			= -Wno-implicit-fallthrough
OPTS_DEBUG		= -Og -g
OPTS_RELEASE	= -O3 -s --static
LIBS			= -lz -lprotobuf-c
LIBS_DIR		= -L./built_libs -I./other_includes

ELF				= chiyotatsu.elf
MAIN			= chiyotatsu.c

COMPONENTS_C	= ${wildcard own_utils/*.c} ${wildcard proto_files/c_stuff/*.c}
COMPONENTS_O	= ${patsubst %.c,%.o,${COMPONENTS_C}}

OTHER_LIBS		= built_libs/libz.a built_libs/libprotobuf-c.a

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

built_libs/libprotobuf-c.a:
	mkdir -p other_includes/
	cd other_libs/protobuf-c; ./autogen.sh && ./configure
	$(MAKE) -C other_libs/protobuf-c
	cp other_libs/protobuf-c/protobuf-c/.libs/libprotobuf-c.a built_libs/
	cp other_libs/protobuf-c/protobuf-c/.libs/libprotobuf-c.so built_libs/
	cp other_libs/protobuf-c/protobuf-c/protobuf-c.h other_includes/

built_libs/libz.a:
	mkdir -p other_includes/
	mkdir -p built_libs/remnants/zlib_folder/
	cd built_libs/remnants/zlib_folder; cmake ../../../other_libs/zlib
	$(MAKE) -C built_libs/remnants/zlib_folder
	cp built_libs/remnants/zlib_folder/libz.so built_libs/
	cp built_libs/remnants/zlib_folder/libz.a built_libs/
	cp built_libs/remnants/zlib_folder/zconf.h other_includes/
	cp other_libs/zlib/zlib.h other_includes/

clean:
	rm -f ${ELF}
	rm -f ${COMPONENTS_O}

all: clean ${ELF}
elf: clean ${ELF}

.PHONY: all clean test debug
