// START:header
tree grammar Gen;

options {
  tokenVocab=CMinus; // import tokens from CMinus.g
  ASTLabelType=CommonTree;
  output=template;
  rewrite=true;
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
    :   ^(VAR type ID)
    ;

function
    :   ^(FUNC type ID formalParameter* block)
    ;

formalParameter
    :   ^(ARG type ID)
    ;

type:   'int' 
    |   'void'
    ;
// END:decl

// START:stat
block
    :   ^(SLIST variable* stat*)
    ;

stat
scope {
boolean isAssign;
}
    :   expr
    |   block
    |   ^('=' ID {$stat::isAssign=true;} expr)
        -> template(id={$ID.text},assign={$text})
           "<assign> write_to(\"<id>\",<id>);"
    ;
// END:stat

// START:expr
expr:   ID
    |   INT
    |   ^(CALL ID expr*)
        -> {$stat::isAssign}? template(id={$ID.text},e={$text})
           "eval(\"<id>\",<e>)"
        -> template(id={$ID.text},e={$text})
           "<e> call(\"<id>\")"
    ;
// END:expr
