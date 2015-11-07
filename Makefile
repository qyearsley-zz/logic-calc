all: lexer

clean:
	rm lex.yy.c lexer

lexer:
	lex logic.l && cc lex.yy.c -o lexer -ll


