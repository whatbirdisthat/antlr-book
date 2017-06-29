// START:override
grammar E2;

@members {
public String getErrorMessage(RecognitionException e,
                              String[] tokenNames)
{
    List stack = getRuleInvocationStack(e, this.getClass().getName());
    String msg = null;
    if ( e instanceof NoViableAltException ) {
       NoViableAltException nvae = (NoViableAltException)e;
       msg = " no viable alt; token="+e.token+
          " (decision="+nvae.decisionNumber+
          " state "+nvae.stateNumber+")"+
          " decision=<<"+nvae.grammarDecisionDescription+">>";
    }
    else {
       msg = super.getErrorMessage(e, tokenNames);
    }
    return stack+" "+msg;
}
public String getTokenErrorDisplay(Token t) {
    return t.toString();
}
}
// END:override

prog:   stat+ ;

stat:   expr ';'        {System.out.println("found expr: "+$stat.text);}
    |   ID '=' expr ';' {System.out.println("found assign: "+$stat.text);}
    ;

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
