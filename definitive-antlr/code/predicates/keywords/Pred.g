grammar Pred;

// START:rules
prog: stat+ ;

/** ANTLR pulls predicates from keyIF and keyCALL into
 *  decision for this rule.
 */
stat: keyIF expr stat
    | keyCALL ID ';'
    | ';'
    ;

expr: ID
    ;

/** An ID whose text is "if" */
keyIF : {input.LT(1).getText().equals("if")}? ID ;

/** An ID whose text is "call" */
keyCALL : {input.LT(1).getText().equals("call")}? ID ;
// END:rules

ID : 'a'..'z'+ ;
WS : (' '|'\n'|'\r')+ {$channel=HIDDEN;} ;
