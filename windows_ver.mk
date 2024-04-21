include config.mk
EXE				= chiyotatsu.exe

UTILCO		= ${patsubst %.c,%.o,${UTILC}}
UTILCPPO	= ${patsubst %.cpp,%.o,${UTILCPP}}
PROTO_O		= ${patsubst %.cc,%.o,${PROTOCPP}}

default: clean exe_release

clean:
	-@rm -fv src/utils/*.o
	-@rm -fv src/compiled_proto/*.o

exe_release: ${UTILCO} ${UTILCPPO} ${PROTO_O}
	${MINGWCPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS} --static -o ${ELF} ${MAIN}\
		${UTILCO}\
		${UTILCPPO}\
		${PROTO_O}\
		${LIBS}
	strip ${ELF}

%.o: %.c
	${MINGWCC} ${CFLAGS} ${CSTD} ${RELEASE_FLAGS}\
		${NO_WARN}\
		-o $@\
		-c $<

%.o: %.cpp
	${MINGWCPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS}\
		${NO_WARN}\
		-o $@\
		-c $<

%.o: %.cc
	${MINGWCPP} ${CFLAGS} ${CPPSTD} ${RELEASE_FLAGS}\
		${NO_WARN}\
		-o $@\
		-c $<

.PHONY: default clean elf_debug elf_release exe_release
