%option outfile="scanner.c"
%option noyywrap
%option nounput
%option noinput

%{
#include "parser.h" // For the token types from bison.
%}

%%

"if"    { return IF; }
"else"  { return ELSE; }
"0"     { return FALSE; }
"1"     { return TRUE; }

"("     { return PARL; }
")"     { return PARR; }

" "     { /* ignore spaces */ }
"\n"    { /* ignore enter */}
"other" { return OTHER; }
.       { printf("LEXICAL ERROR: Unknown symbol %s\n", yytext);
          exit(EXIT_FAILURE); }
