include config.mk
ELF				= chiyotatsu.elf
COMPILED_LIBS	= protobuf zlib

default: clean elf_release

clean:
	-@rm -fv src/utils/*.o
	-@rm -fv src/compiled_proto/*.o
	-@rm -rfv other_libs/protobuf/build/

elf_debug: ${UTILCO} ${UTILCPPO} ${PROTO_O}
	${CPP} ${CFLAGS} ${CPPSTD} ${DEBUG_FLAGS} -o ${ELF} ${MAIN}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		${LIBS}

elf_release: ${UTILCO} ${UTILCPPO} ${PROTO_O}
	${CPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS} --static -o ${ELF} ${MAIN}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		${LIBS}
	strip ${ELF}

%.o: %.c
	${CC} ${CFLAGS} ${CSTD} ${RELEASE_FLAGS}\
		${NO_WARN}\
		-o $@\
		-c $<

%.o: %.cpp
	${CPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS}\
		${NO_WARN}\
		-o $@\
		-c $<

%.o: %.cc
	${CPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS}\
		${NO_WARN}\
		-o $@\
		-c $<

.PHONY: default clean elf_debug elf_release exe_release
