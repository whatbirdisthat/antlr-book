// START:header
grammar CMinus;
options {output=AST;}

tokens {
  VAR;   // variable definition
  FUNC;  // function definition
  ARG;   // formal argument
  SLIST; // statement list
  CALL;  // function call
}
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
    :   type ID ';' -> ^(VAR type ID)
    ;

function
    :   type ID '(' ( formalParameter (',' formalParameter)* )? ')' block
        -> ^(FUNC type ID formalParameter* block)
    ;

formalParameter
    :   type ID -> ^(ARG type ID)
    ;

type:   'int' 
    |   'void'
    ;
// END:decl

// START:stat
block
    :   lc='{' variable* stat* '}'
        -> ^(SLIST[$lc,"SLIST"] variable* stat*)
    ;

stat
    :   expr ';'!
    |   block
    |   ID '=' expr ';' -> ^('=' ID expr)
    |   ';'!
    ;
// END:stat

// START:expr
expr:   ID
    |   INT
    |   ID '(' ( expr (',' expr)* )? ')' -> ^(CALL ID expr*)
    |   '(' expr ')' -> expr
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
