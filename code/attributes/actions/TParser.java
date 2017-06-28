/***
 * Excerpted from "The Definitive ANTLR Reference",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/tpantlr for more book information.
***/

package p;

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class TParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "A"
    };
    public static final int A=4;
    public static final int EOF=-1;
        public TParser(TokenStream input) {
            super(input);
        }
    public String[] getTokenNames() { return tokenNames; }
    public String getGrammarFileName() { return "T.g"; }

    int i;
    public TParser(TokenStream input, int foo) {
        this(input);
        i = foo;
    }


    
    // T.g:15:1: a[int x] returns [int y] : A ;
    public int a(int x) throws RecognitionException {   
        int y = 0; // auto-initialized by ANTLR
        int z=0;
        try {
            // T.g:18:4: A
            action1
            match(input,A,FOLLOW_A_in_a40); 
            action2
            System.out.println("after matching rule; before finally");
        }
        catch (RecognitionException re) {
            System.err.println("error");
        }
        finally {
             do-this-no-matter-what
        }
        return y;
    }
    

    public static final BitSet FOLLOW_A_in_a40 = new BitSet(new long[]{0x0000000000000002L});
}
