%output "parser.c"          // File name of generated parser.
%defines "parser.h"         // Produces a 'parser.h'
%define parse.error verbose // Give proper messages when a syntax error is found.
%define parse.lac full      // Enable LAC to improve syntax error handling.


%{
#include <stdio.h>
int yylex(void);
void yyerror(char const *s);
%}
%token IF ELSE TRUE FALSE PARL PARR OTHER


%%
statement : if-stmt | OTHER;
if-stmt : IF PARL exp PARR statement
            | IF PARL exp PARR statement ELSE statement;
exp : TRUE | FALSE;
%%
int main(void) {
    if (yyparse() == 0) printf("PARSE SUCCESSFUL!\n");
    else                printf("PARSE FAILED!\n");
    return 0;
}
