%{
#include "y.tab.h"
%}

%%

not { return NOT; }
or  { return OR; }
and { return AND; }
\(  { return LPAREN; }
\)  { return RPAREN; }
=   { return ASSIGN; }
false { return FALSE; }
true  { return TRUE; }

[a-z] { yylval = yytext[0] - 'a'; return NAME; }

\n { return 0; }  // End marker.

. ;  // Ignore everything else.

%%
