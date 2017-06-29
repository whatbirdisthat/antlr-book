grammar RubyPred;

expr:   atom ('+' atom)* 
    ;

// atom hoists predicates from arrayIndex, methodCall into decision
atom:   arrayIndex
    |   methodCall ('[' INT ']')?
    ;

arrayIndex
    :   {isArray(input.LT(1))}?  ID '[' INT ']'
    ;
    
methodCall
    :   {isMethod(input.LT(1))}? ID ('(' expr (',' expr)* ')')?
    ;
