%{
#include <stdio.h>
// int yydebug = 1;
%}

%token TRUE FALSE AND OR NOT LPAREN RPAREN

%%

expr	: literal
	| unary
	| binary
	| parens
	{ printf("Parsed expr.\n"); }
	;

literal	: TRUE
	| FALSE
	{ printf("Parsed literal.\n"); }
	;

unary	: NOT expr
	{ printf("Parsed not expr.\n"); }
	;

binary	: expr AND expr
	| expr OR expr
	{ printf("Parsed binary expr.\n"); }
	;

parens	: LPAREN expr RPAREN
	{ printf("Parsed paren expr.\n"); }
	;

%%

extern FILE *yyin;

int main() {
  yyparse();
  printf("Called yyparse once; terminating.\n"); 
}

yyerror(s) char *s; {
  fprintf(stderr, "yyerror called with: %s\n", s);
}
