%{
#include "y.tab.h"
%}

%%

not { return NOT; }
or  { return OR; }
and { return AND; }
\(  { return LPAREN; }
\)  { return RPAREN; }
false { yylval = 0; return FALSE; }
true  { yylval = 1; return TRUE; }

\n { return 0; }

. ;  // Ignore everything else.

%%
