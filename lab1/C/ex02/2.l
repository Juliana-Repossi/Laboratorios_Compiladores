%{
    #include <stdio.h>
%}
%%
[A-Z] {printf("%c",*yytext+32);}
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}