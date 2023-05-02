%{
#include "calculator.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[-+*/\n]    { return yytext[0]; }
.           { printf("Invalid character: %c\n", *yytext); }
%%

int yywrap(void) {
    return 1;
}
