/***
 * Excerpted from "The Definitive ANTLR Reference",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/tpantlr for more book information.
***/
import java.io.*;
import org.antlr.runtime.*;

public class TestInfLoop {
    public static void main(String[] args) throws Exception {
        infloopLexer lex =
            new infloopLexer(new ANTLRInputStream(System.in));
        CommonTokenStream tokens = new CommonTokenStream(lex);
        infloopParser p = new infloopParser(tokens);
        p.slist();
    }
}
