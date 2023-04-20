%{  
    #include <stdio.h>
%}

/*definições*/

letra [a-zA-Z]
numero [0-9]

identificador ({letra}{letra}*)
aspas (\")
string ({aspas}[^"]*{aspas})
inteiros ({numero}{numero}*)
reais ({inteiros}[.]{inteiros})

/*para contar as linhas automaticamente*/
%option yylineno

%%

program {printf("%d: %s -> PROGRAM\n",yylineno,yytext);}
begin {printf("%d: %s -> BEGIN\n",yylineno,yytext);}
read {printf("%d: %s -> READ\n",yylineno,yytext);}
write {printf("%d: %s -> WRITE\n",yylineno,yytext);}
true {printf("%d: %s -> TRUE\n",yylineno,yytext);}
false {printf("%d: %s -> FALSE\n",yylineno,yytext);}
if {printf("%d: %s -> IF\n",yylineno,yytext);}
then {printf("%d: %s -> THEN\n",yylineno,yytext);}
else {printf("%d: %s -> ELSE\n",yylineno,yytext);}
end {printf("%d: %s -> END\n",yylineno,yytext);}
repeat {printf("%d: %s -> REPEAT\n",yylineno,yytext);}
until {printf("%d: %s -> UNTIL\n",yylineno,yytext);}
var {printf("%d: %s -> VAR\n",yylineno,yytext);}

bool {printf("%d: %s -> BOOL\n",yylineno,yytext);}
int {printf("%d: %s -> INT\n",yylineno,yytext);}
real {printf("%d: %s -> REAL\n",yylineno,yytext);}
string {printf("%d: %s -> STRING\n",yylineno,yytext);}

:= {printf("%d: %s -> ASSIGN\n",yylineno,yytext);}
= {printf("%d: %s -> EQ\n",yylineno,yytext);}
"<" {printf("%d: %s -> LT\n",yylineno,yytext);}
"+" {printf("%d: %s -> PLUS\n",yylineno,yytext);}
"-" {printf("%d: %s -> MINUS\n",yylineno,yytext);}
"*" {printf("%d: %s -> TIMES\n",yylineno,yytext);}
"/" {printf("%d: %s -> OVER\n",yylineno,yytext);}
"(" {printf("%d: %s -> LPAR\n",yylineno,yytext);}
")" {printf("%d: %s -> RPAR\n",yylineno,yytext);}
; {printf("%d: %s -> SEMI\n",yylineno,yytext);}

{identificador} {printf("%d: %s -> ID\n",yylineno,yytext);}
{string} {printf("%d: %s -> STR_VAL\n",yylineno,yytext);}
{inteiros} {printf("%d: %s -> INT_VAL\n",yylineno,yytext);}
{reais} {printf("%d: %s -> REAL_VAL\n",yylineno,yytext);}

"{"[^}]*"}" {}

[ \t\n] {}

. {printf("LEXICAL ERROR (%d): Unknown symbol %s\n",yylineno,yytext); return 0;}

%%

int main() {
  yylex();
  return 0;
}

/* Definindo esta funcao nao precisa compilar com -lfl */
int yywrap() {
  return 1;
}
