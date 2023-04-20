%{
    #include <stdio.h>
%}

/* definicao de digito hexadecimal */
digito ([0-9]|[a-fA-F])
hexa ({digito}{1,8})
hexadecimal (0(x|X){hexa}([ \n]))

%%
{hexadecimal} {printf("Esse numero é hexadecimal: %s\n",yytext);}
(.|\n) {}
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}