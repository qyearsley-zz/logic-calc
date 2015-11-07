%%

not { printf("NOT: %s\n", yytext); }
or  { printf("OR: %s\n", yytext); }
and { printf("AND: %s\n", yytext); }
\(  { printf("LPAREN: %s\n", yytext); }
\)  { printf("RPAREN: %s\n", yytext); }
false { printf("FALSE: %s\n", yytext); }
true  { printf("TRUE: %s\n", yytext); }

. ;  // Ignore everything else.

%%
