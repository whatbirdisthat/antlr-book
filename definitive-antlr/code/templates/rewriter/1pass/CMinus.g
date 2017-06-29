// START:header
grammar CMinus;
options {output=template; rewrite=true;}
// END:header

// START:decl
program
    :   declaration+
    ;

declaration
    :   variable
    |   function
    ;

variable
    :   type ID ';'
    ;

function
    :   type ID '(' ( formalParameter (',' formalParameter)* )? ')' block
    ;

formalParameter
    :   type ID
    ;

type:   'int' 
    |   'void'
    ;
// END:decl

// START:stat
stat
scope {
boolean isAssign;
}
    :   expr ';'
    |   block
    |   ID '=' {$stat::isAssign=true;} expr ';'
        -> template(id={$ID.text},assign={$text})
           "<assign> write_to(\"<id>\",<id>);"
    |   ';'
    ;

block
    :   '{' variable* stat* '}'
    ;
// END:stat

// START:expr
expr:   ID
    |   INT
    |   ID '(' ( expr (',' expr)* )? ')'
        -> {$stat::isAssign}? template(id={$ID.text},e={$text})
           "eval(\"<id>\",<e>)"  // rewrite ...=f(3) as eval("f",f(3))
        -> template(id={$ID.text},e={$text})
           "<e>; call(\"<id>\")" // rewrite ...f(3) as f(3); call("f")
    |   '(' expr ')'
    ;
// END:expr

// START:tokens
ID  :   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

INT :   ('0'..'9')+
    ;

CMT :   '/*' (options {greedy=false;} : .)* '*/' {$channel = HIDDEN;} ;

WS  :   ( ' ' | '\t' | '\r' | '\n' )+ {$channel = HIDDEN;}
    ;    
// END:tokens
