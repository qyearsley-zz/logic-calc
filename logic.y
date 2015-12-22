%{
#include <stdio.h>

struct symbol_entry {
  char *name;
};

%}

%token TRUE FALSE AND OR NOT
%left OR
%left AND
%left NOT

%%

start	: statement { printf($1); }
	| expr {
	  if ($1) {
	    printf("true\n");
	  } else {
	    printf("false\n");
	  }
	}

expr	: NOT expr { $$ = ! $2; }
	| expr AND expr { $$ = ($1 && $3); }
	| expr OR expr { $$ = ($1 || $3); }
	| '(' expr ')' { $$ = $2; }
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
