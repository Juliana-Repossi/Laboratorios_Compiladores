grammar ex03;

#PAREI AQUI

begin:
  statement
;
switch_stmt:
  SWITCH ID LBRACE case_stmt+ default_stmt? RBRACE
;
case_stmt:
  CASE INT_VAL COLON BREAK SEMI
;
default_stmt:
  DEFAULT COLON
;

SWITCH  : 'switch';
CASE    : 'case';
DEFAULT : 'default';
BREAK   : 'break';
COLON   : ':' ;
SEMI    : ';' ;
LBRACE  : '{' ;
RBRACE  : '}' ;
INT_VAL : [0-9]+ ;
ID      : [a-zA-Z]+ ;
WS      : [ \t\n]+ -> skip ;
UNKNOWN : . {System.out.println("Error: linha " + getLine() + ".Token " + getText() + "não recohecido"); System.exit(1);};
