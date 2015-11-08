%{
#include "y.tab.h"
%}

%%

not { return NOT; }
or  { return OR; }
and { return AND; }
\(  { return LPAREN; }
\)  { return RPAREN; }
false { return FALSE; }
true  { return TRUE; }

\.\n { return 0; }

. ;  // Ignore everything else.

%%
