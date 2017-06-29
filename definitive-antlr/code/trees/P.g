/** Sample grammar to demonstrated parse tree construction
 *  via the debug event listener interface.
 */
grammar P;

prog: decl* stat* ;

decl: type ID (',' ID)* ';' ;

type: 'int' | 'float' ;

stat: 'if' expr 'then' stat ('else' stat)?
    | ID '=' expr
    ;

expr: INT
    | 'true'
    ;

ID  : 'a'..'z'+ ;
INT : '0'..'9'+ ;
WS  : (' '|'\n'|'\r')+ {$channel=HIDDEN;} ;
