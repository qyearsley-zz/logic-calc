%{
#include <stdio.h>
// int yydebug = 1;
%}

%token TRUE FALSE AND OR NOT LPAREN RPAREN

%%

start	: expr {
    if ($1) {
      printf("true\n");
    } else {
      printf("false\n");
    }
  }

expr	: NOT expr { $$ = ! $2; printf("not expr, ! %d = %d\n", $2, !$2); }
	| expr AND expr { $$ = ($1 && $3); }
	| expr OR expr { $$ = ($1 || $3); }
	| LPAREN expr RPAREN { $$ = $2; }
	| TRUE { $$ = $1; }
	| FALSE {$$ = $1; }
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
