%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

statement:
    expression '\n'        { printf("Result: %d\n", $1); }
;

expression:
    expression '+' expression   { $$ = $1 + $3; }
    | expression '-' expression { $$ = $1 - $3; }
    | expression '*' expression { $$ = $1 * $3; }
    | expression '/' expression { $$ = $1 / $3; }
    | NUMBER                    { $$ = $1; }
;

%%

int main(void) {
    yyparse();
    return 0;
}

int yyerror(char* msg) {
    fprintf(stderr, "%s\n", msg);
    return 0;
}
