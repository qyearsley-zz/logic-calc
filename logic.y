%{
#include <stdio.h>
#include "calc.h"
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
