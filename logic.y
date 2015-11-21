%{
#include <stdio.h>
%}

%token TRUE FALSE AND OR NOT LPAREN RPAREN
%left OR
%left AND
%left NOT

%%

start	: expr {
	  if ($1) {
	    printf("true\n");
	  } else {
	    printf("false\n");
	  }
	}

expr	: NOT expr { $$ = ! $2; }
	| expr AND expr { $$ = ($1 && $3); }
	| expr OR expr { $$ = ($1 || $3); }
	| LPAREN expr RPAREN { $$ = $2; }
	| TRUE { $$ = 1; }
	| FALSE { $$ = 0; }
	;

%%

extern FILE *yyin;

int main() {
  do {
    printf("> ");
    yyparse();
  } while (!feof(yyin));
}

yyerror(s) char *s; {
  fprintf(stderr, "yyerror called with: %s\n", s);
}
