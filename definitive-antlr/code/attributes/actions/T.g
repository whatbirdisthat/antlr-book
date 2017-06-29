parser grammar T;

@header {
package p;
}

@members {
int i;
public TParser(TokenStream input, int foo) {
    this(input);
    i = foo;
}
}

a[int x] returns [int y]
@init {int z=0;}
@after {System.out.println("exiting");}
    :   {action1} A {action2}
    ;
    catch[RecognitionException re] {
        System.err.println("error");
    }
    finally { }
