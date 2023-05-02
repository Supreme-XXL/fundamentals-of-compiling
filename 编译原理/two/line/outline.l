%{
int line_num = 1;
%}

%%
\n    { printf("%d: ", line_num++); }
.     { putchar(yytext[0]); }
%%
int yywrap() {
    return 1;
}


int main() {
    yylex();
    return 0;
}
