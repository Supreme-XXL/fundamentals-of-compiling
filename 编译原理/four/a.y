%{
#include <stdio.h>
#include <math.h>

int yylex(void);
void yyerror(char*);

static int result;

%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%left '^'

%%
statement   :   expr '\n'        { printf("= %d\n", result); }
            ;

expr        :   expr '+' term  { result = $1 + $3; $$ = result; }
            |   expr '-' term  { result = $1 - $3; $$ = result; }
            |   term           { result = $1; $$ = result; }
            ;

term        :   term '*' factor{ result = $1 * $3; $$ = result; }
            |   term '/' factor{ 
                    if($3 == 0) {
                        yyerror("Division by zero");
                    } else {
                        result = $1 / $3; 
                        $$ = result;
                    }
                }
            |   factor         { result = $1; $$ = result; }
            ;

factor      :   factor '^' power{ result = pow($1, $3); $$ = result; }
            |   power          { result = $1; $$ = result; }
            ;

power       :   '(' expr ')'   { $$ = result; }
            |   NUMBER          { $$ = $1; }
            ;

%%

void yyerror(char* s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
