// START:header
grammar Expr;
options {output=template;}

@header {
import java.util.HashMap;
}

@members {
int numOps = 0; // track operations for stack size purposes
HashMap locals = new HashMap(); // map ID to local var number
/* Count local variables, but don't use 0, which in this case 
 * is the String[] args parameter of the main method.
 */
int localVarNum = 1;
}
// END:header

// START:file
prog
@after {
// number of elements on stack is roughly number of operations + 1
// and add one for the address of the System.out object
%{$st}.maxStackDepth = numOps+1+1;
// number of locals = number of locals + parameters plus 'this'
// if non-static method.
%{$st}.maxLocals = locals.size()+1;
}
    :   (s+=stat)+ -> jasminFile(instructions={$s})
    ;
// END:file

// START:stat
stat:   expr NEWLINE -> exprStat(v={$expr.st}, descr={$expr.text})
    |   ID '=' expr NEWLINE
        {
        if ( locals.get($ID.text)==null ) {
            locals.put($ID.text, new Integer(localVarNum++));
        }
        }
        -> assign(id={$ID.text},
                  descr={$text},
                  varNum={locals.get($ID.text)},
                  v={$expr.st})
    |   NEWLINE
    ;
// END:stat

// START:addsub
expr
    :   multExpr ( ops+=addOp | ops+=subOp )*
        -> expr(firstExpr={$multExpr.st}, ops={ops})
    ;

addOp
    :   '+' multExpr {numOps++;} -> add(opnd={$multExpr.st})
    ;

subOp
    :   '-' multExpr {numOps++;} -> sub(opnd={$multExpr.st})
    ;
// END:addsub

// START:mult
multExpr
    :   f=atom ('*' opnds+=atom {numOps++;})*
        -> mult(firstExpr={$f.st},opnds={$opnds})
    ; 
// END:mult

// START:values
atom:   INT -> int(v={$INT.text})
    |   ID  -> var(id={$ID.text}, varNum={locals.get($ID.text)})
    |   '(' expr ')' -> {$expr.st}
    ;
// END:values

// START:tokens
ID  :   ('a'..'z'|'A'..'Z')+ ;
INT :   '0'..'9'+ ;
NEWLINE:'\r'? '\n' ;
WS  :   (' '|'\t'|'\r'|'\n')+ {skip();} ;
// END:tokens
