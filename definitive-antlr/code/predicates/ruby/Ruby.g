grammar Ruby;

expr:   atom ('+' atom)* // E.g., "a[i]+foo[i]"
    ;

atom:   arrayIndex
    |   methodCall ('[' INT ']')? // E.g., "foo[i]" or "foo(3,4)[i]"
    ;

arrayIndex
    :   ID '[' INT ']' // E.g., "a[i]"
    ;
    
methodCall
    :   ID ( '(' expr (',' expr)* ')' )? // E.g., "foo" or "foo(3,4)"
    ;
//...
