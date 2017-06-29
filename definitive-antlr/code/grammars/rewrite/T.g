// START:rules
grammar T;
options {output=template; rewrite=true;}

decl:   type ID ';' ;                 // no translation here

type:   'int' -> template() "Integer" // translate int to Integer
    |   ID                            // leave this alone
    ;
// END:rules
ID  :   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')* ;
INT :   ('0'..'9')+ ;
WS  :   ( ' ' | '\t' | '\r' | '\n' )+ {$channel = HIDDEN;} ;    
