// START:override
grammar Exc;

tokens { SEMI=';'; }

@members {
protected void mismatch(IntStream input, int ttype, BitSet follow)
    throws RecognitionException
{
    throw new MismatchedTokenException(ttype, input);
}
public void recoverFromMismatchedSet(IntStream input,
                                     RecognitionException e,
                                     BitSet follow)
    throws RecognitionException
{
    throw e;
}
}

@rulecatch {
catch (RecognitionException e) {
    throw e;
}
}
// END:override

prog:   stat+ ;

// START:stat
stat:   expr ';'
        {System.out.println("found expr: "+$stat.text);}
    |   ID '=' expr ';'
        {System.out.println("found assign: "+$stat.text);}
    ;
    catch [RecognitionException re] {
        reportError(re);
        consumeUntil(input, SEMI); // throw away all until ';'
        input.consume(); // eat the ';'
    }
// END:stat

expr:   multExpr (('+'|'-') multExpr)*
    ;

multExpr
    :   atom ('*' atom)*
    ;

atom:   INT 
    |   '(' expr ')'
    ;

ID  :   ('a'..'z'|'A'..'Z')+ ;
INT :   '0'..'9'+ ;
WS  :   (' '|'\t'|'\n'|'\r')+ {skip();} ;
