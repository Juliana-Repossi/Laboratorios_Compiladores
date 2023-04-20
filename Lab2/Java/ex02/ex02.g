grammar ex02;

begin:
  expr+
;

expr:
    expr (DIV   |   MULT) expr
|   expr (MINUS |   PLUS) expr 
|   PARL expr PARR
|   NUM
; 

PLUS : '+';
MINUS: '-';
DIV: '/';
MULT: '*';
PARL: '(';
PARR: ')';
NUM: [0-9]+;
WS: [ \t\n]+ -> skip;
UNKNOWN : . {System.out.println("Error: linha " + getLine() + ".Token " + getText() + "não recohecido"); System.exit(1);};

