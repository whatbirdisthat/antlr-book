// START:override
/** This grammar demonstrates creating a "paraphrase" error reporting option. */
grammar P;

@members {
Stack paraphrases = new Stack();
public String getErrorMessage(RecognitionException e,
                              String[] tokenNames)
{
    String msg = super.getErrorMessage(e, tokenNames);
    if ( paraphrases.size()>0 ) {
        String paraphrase = (String)paraphrases.peek();
        msg = msg+" "+paraphrase;
    }
    return msg;
}
}
// END:override

// START:rules
prog:   stat+ ;

stat
@init  { paraphrases.push("in statement"); }
@after { paraphrases.pop(); }
    :   expr ';'
        {System.out.println("found expr: "+$stat.text);}
    |   ID '=' expr ';'
        {System.out.println("found assign: "+$stat.text);}
    ;

expr
@init  { paraphrases.push("in expression"); }
@after { paraphrases.pop(); }
    :   multExpr (('+'|'-') multExpr)*
    ;

multExpr
    :   atom ('*' atom)*
    ;

atom:   INT 
    |   '(' expr ')'
    ;
// END:rules

ID  :   ('a'..'z'|'A'..'Z')+ ;
INT :   '0'..'9'+ ;
WS  :   (' '|'\t'|'\n'|'\r')+ {skip();} ;
