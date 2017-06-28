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
   .limit stack 3 ; how much stack space do we need?
   .limit locals 2 ; how many locals do we need?
   getstatic java/lang/System/out Ljava/io/PrintStream;
; START:stat
   ; code translated from input stream
   ; compute 3+4
   ldc 3
   ldc 4
   iadd
   istore 1 ; a=3+4
   ; compute a
   iload 1 ; a
; END:stat

   ; print result on top of stack
   invokevirtual java/io/PrintStream/println(I)V
   return
.end method
