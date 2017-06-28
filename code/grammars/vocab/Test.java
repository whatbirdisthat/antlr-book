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

public class Test {
    public static void main(String[] args) throws Exception {

        // Create an input character stream from standard input
        ANTLRInputStream input = new ANTLRInputStream(System.in);
        PLexer lexer = new PLexer(input);     // create lexer
        // Create a buffer of tokens between the lexer and parser
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        PParser parser = new PParser(tokens); // create parser
        PParser.expr_return r = null;
        r = parser.expr(); // parse rule expr and get return structure
        CommonTree t = (CommonTree)r.getTree();// extract AST
        System.out.println(t.toStringTree());  // print out
        // Create a stream of nodes from a tree
        CommonTreeNodeStream nodes = new CommonTreeNodeStream(t);
        Dump dumper = new Dump(nodes);         // create tree parser
        dumper.expr();                         // parse expr
        System.out.println();

    }
}
