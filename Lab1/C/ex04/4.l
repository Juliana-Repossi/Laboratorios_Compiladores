%{  
    #include <stdio.h>
%}
/*Só para modularizar*/
letra [A-Z]
parte1 ({letra}{3})
numero [0-9]
parte2 ({numero}{4})
placa ({parte1}-{parte2})

%%
{placa} {printf("Essa e uma placa valida:%s\n",yytext);}
(.|\n) {}
%%

int main() {
  yylex();
  return 0;
}

/* Definindo esta funcao nao precisa compilar com -lfl */
int yywrap() {
  return 1;
}
