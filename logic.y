%{
#include <stdio.h>
int yydebug = 1;
%}

%token TRUE FALSE AND OR NOT LPAREN RPAREN

%%

expression : literal | parens ;

literal : TRUE | FALSE ;

parens : LPAREN expression RPAREN ;

%%

/*
expression: literal | unary | binary | parens { printf("Parsed an expression!\n"); }
	;

literal: TRUE
	| FALSE { printf("Parsed literal."); }
	;

unary:	NOT expression { printf("Parsed not expression"); }
	;

binary:	expression AND expression
	| expression OR expression { printf("Parsed binary expression.\n"); }
	;

parens:  LPAREN expression RPAREN { printf("Parsed paren expression.\n"); }
	;

%%

*/

extern FILE *yyin;

int main() {
  do {
    yyparse();
    printf("Just called yyparse.\n");
  } while (!feof(yyin));
}

yyerror(s) char *s; {
  fprintf(stderr, "%s\n", s);
}
