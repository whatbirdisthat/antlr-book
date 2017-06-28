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
import org.antlr.runtime.debug.*;

/** Test grammar P; use -debug flag so parser fires
 *  debug events. ParseTreeBuilder used to build parse trees.
 */
public class TestP {
    public static void main(String[] args) throws Exception {
        // create the lexer attached to stdin
        ANTLRInputStream input = new ANTLRInputStream(System.in);
        PLexer lexer = new PLexer(input);
        // create the buffer of tokens between the lexer and parser
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        // create a debug event listener that builds parse trees
        ParseTreeBuilder builder = new ParseTreeBuilder("prog");
        // create the parser attached to the token buffer
        // and tell it which debug event listener to use
        PParser parser = new PParser(tokens, builder);
        // launch the parser starting at rule prog
        parser.prog();
	System.out.println(builder.getTree().toStringTree());
    }
}
