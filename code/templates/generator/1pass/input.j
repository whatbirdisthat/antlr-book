; public class Calc extends Object { ...}
.class public Calc
.super java/lang/Object

; public Calc() { super(); } // calls java.lang.Object()
.method public <init>()V
   aload_0
   invokenonvirtual java/lang/Object/<init>()V
   return
.end method

; main(): Expr.g will generate bytecode in this method
.method public static main([Ljava/lang/String;)V
START_HIGHLIGHT
   .limit stack 4 ; how much stack space do we need?
   .limit locals 1 ; how many locals do we need?
END_HIGHLIGHT
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ; code translated from input stream
START_HIGHLIGHT
   ; compute 3+4*5
   ldc 3
   ldc 4
   ldc 5
   imul
   iadd
END_HIGHLIGHT
   ; print result on top of stack
   invokevirtual java/io/PrintStream/println(I)V
   return
.end method
