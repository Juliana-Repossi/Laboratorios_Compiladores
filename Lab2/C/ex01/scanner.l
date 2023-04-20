%option outfile="scanner.c"
%option noyywrap
%option nounput
%option noinput
%{
#include "parser.h" // For the token types from bison.
%}
%%
"(" { return PARL; }
")" { return PARR; }
"a" { return A;    }
" " {              }
.   { printf("LEXICAL ERROR: Unknown symbol %s\n", yytext);
          exit(EXIT_FAILURE); }

