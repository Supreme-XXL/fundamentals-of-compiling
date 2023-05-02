%{
int count = 0;
%}

%%
[0-9]+    { 
             printf("%x", atoi(yytext)); 
             count++; 
         }
.         { putchar(yytext[0]); }
%%

int yywrap() {
    return 1;
}


int main() {
    yylex();
    printf("\n%d decimal numbers replaced\n", count);
    return 0;
}
