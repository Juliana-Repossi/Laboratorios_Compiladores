grammar ex01;

begin:
  expr+
;

expr:
  PARL expr PARR
| A
;



A       : 'a' ;
PARL    : '('    ;
PARR    : ')'    ;
WS      : [ \t\n]+ -> skip ;
UNKNOWN : . {System.out.println("Error: linha " + getLine() + ".Token " + getText() + "não recohecido"); System.exit(1);};
