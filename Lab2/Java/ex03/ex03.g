grammar ex03;

begin:
  statement
;

statement: 
          ifstmt 
|         OTHER         
;

ifstmt: 
        IF PARL expr PARR statement
|       IF PARL expr PARR statement ELSE statement
;

expr:
      TRUE | FALSE
;


IF      : 'if';
ELSE    : 'else';
PARL    : '(';
PARR    : ')';
TRUE    : '1';
FALSE   : '0';
OTHER   : 'other';
WS      : [ \t\n]+ -> skip ;
UNKNOWN : . {System.out.println("Error: linha " + getLine() + ".Token " + getText() + "não recohecido"); System.exit(1);};
