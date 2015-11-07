%%

!  { printf("NOT: %s\n", yytext); }
\| { printf("OR: %s\n", yytext); }
&  { printf("AND: %s\n", yytext); }
\( { printf("LPAREN: %s\n", yytext); }
\) { printf("RPAREN: %s\n", yytext); }
0  { printf("FALSE: %s\n", yytext); }
1  { printf("TRUE: %s\n", yytext); }

[a-zA-Z]+ { printf("SYMBOL: %s\n", yytext); }

. ;  // Ignore everything else.

%%

main() {
  yylex();
}

