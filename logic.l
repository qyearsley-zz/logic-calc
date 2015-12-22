%{
#include "y.tab.h"
%}

%%

not { return NOT; }
or  { return OR; }
and { return AND; }
false { return FALSE; }
true  { return TRUE; }

\n { return 0; }  // End marker.

" " ;  // Ignore spaces.

. { return yytext[0]; }

%%
