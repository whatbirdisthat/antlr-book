/***
 * Excerpted from "The Definitive ANTLR Reference",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/tpantlr for more book information.
***/
import org.antlr.runtime.*;
import org.antlr.stringtemplate.*;
import java.io.*;

public class Test {
    public static void main(String[] args) throws Exception {

        ANTLRInputStream input = new ANTLRInputStream(System.in);
        CMinusLexer lexer = new CMinusLexer(input);
        // rewrite=true only works with TokenRewriteStream
        // not CommonTokenStream!
        TokenRewriteStream tokens = new TokenRewriteStream(lexer);
        CMinusParser parser = new CMinusParser(tokens);
        parser.program();
        System.out.println(tokens.toString()); // emit rewritten source

    }
}
