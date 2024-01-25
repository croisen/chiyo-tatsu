CC			= cc
CFLAGS		= -Wall -Wextra -Wpedantic -Werror
OPTS		= -O3 -g

EXE			= chiyotatsu.exe
MAIN		= chiyotatsu.c

all:
	${CC} ${CFLAGS} ${OPTS} -o ${EXE} ${MAIN}
