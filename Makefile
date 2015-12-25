CC = gcc -g
LIBS = -ly -ll
LEX = flex
YACC = yacc
CFLAGS = -DYYDEBUG=1

all: calc

clean:
	rm *.c *.h *.o calc

calc: lex.yy.o y.tab.o calc.c calc.h
	${CC} -o calc calc.o lex.yy.o y.tab.o ${LIBS}

lex.yy.o: lex.yy.c y.tab.h

lex.yy.c: logic.l 
	${LEX} logic.l

y.tab.o: y.tab.c y.tab.h

y.tab.h y.tab.c: logic.y calc.h
	${YACC} -d logic.y

