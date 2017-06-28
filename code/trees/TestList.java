/***
 * Excerpted from "The Definitive ANTLR Reference",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/tpantlr for more book information.
***/
import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class TestList {
    public static void main(String[] args) throws Exception {
        // create the lexer attached to stdin
        ANTLRInputStream input = new ANTLRInputStream(System.in);
        ListLexer lexer = new ListLexer(input);
        // create the buffer of tokens between the lexer and parser
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        // create the parser attached to the token buffer
        ListParser parser = new ListParser(tokens);
        // launch the parser starting at rule r, get return object
        ListParser.r_return result = parser.r();
        // pull out the tree and cast it
        Tree t = (Tree)result.getTree();
	System.out.println(t.toStringTree()); // print out the tree
    }
}
