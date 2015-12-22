%{
#include <stdio.h>

#define TABLE_SIZE 26
#define UNSET -1

int SYMBOL_TABLE[TABLE_SIZE];
int lookup(int symbol_num);
void set(int symbol_num, int value);
void reset_table();

%}

%token AND OR NOT TRUE FALSE LPAREN RPAREN
%token NAME ASSIGN
%left OR
%left AND
%left NOT

%%

start	: stmt { printf($1 ? "true\n" : "false\n"); }
	| expr { printf($1 ? "true\n" : "false\n"); }
	;

expr	: NOT expr { $$ = ! $2; }
	| expr AND expr { $$ = ($1 && $3); }
	| expr OR expr { $$ = ($1 || $3); }
	| LPAREN expr RPAREN { $$ = $2; }
	| NAME { $$ = lookup($1); }
	| FALSE { $$ = 0; }
	| TRUE { $$ = 1; }
	;

stmt	: NAME ASSIGN expr { set($1, $3); $$ = $3; }
	;

%%

extern FILE *yyin;


int main() {
  reset_table();
  do {
    printf("> ");
    yyparse();
  } while (!feof(yyin));
}

yyerror(s) char *s; {
  fprintf(stderr, "yyerror called with: %s\n", s);
}

int lookup(int symbol_num) {
  printf("lookup %d\n", symbol_num);
  if (SYMBOL_TABLE[symbol_num] == UNSET ||
      symbol_num < 0 || symbol_num >= TABLE_SIZE) {
    return 0;  // false by default
  }
  return SYMBOL_TABLE[symbol_num];
}

void set(int symbol_num, int value) {
  printf("set %d %d\n", symbol_num, value);
  if (symbol_num < 0 || symbol_num >= TABLE_SIZE) {
    return;  // do nothing by default
  }
  SYMBOL_TABLE[symbol_num] = value;
}

void reset_table() {
  int i;
  for (i = 0; i < TABLE_SIZE; i++) {
    SYMBOL_TABLE[i] = UNSET;
  }
}
