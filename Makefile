CC = gcc -g
LIBS = -ly -ll
LEX = flex
YACC = yacc
CFLAGS = -DYYDEBUG=1

all: calc

clean:
	rm *.c *.h *.o calc

calc: lex.yy.o y.tab.o
	${CC} -o calc lex.yy.o y.tab.o ${LIBS}

lex.yy.o: lex.yy.c y.tab.h

y.tab.o: y.tab.c y.tab.h

y.tab.h y.tab.c: logic.y
	${YACC} -d logic.y

lex.yy.c: logic.l
	${LEX} logic.l

