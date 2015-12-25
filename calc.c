#include <stdio.h>
#include "calc.h"

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
  if (SYMBOL_TABLE[symbol_num] == UNSET ||
      symbol_num < 0 || symbol_num >= TABLE_SIZE) {
    return 0;  // false by default
  }
  return SYMBOL_TABLE[symbol_num];
}

void set(int symbol_num, int value) {
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
