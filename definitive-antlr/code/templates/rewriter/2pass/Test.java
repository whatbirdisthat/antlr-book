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
import org.antlr.stringtemplate.*;
import java.io.*;

public class Test {
    public static void main(String[] args) throws Exception {

        // PARSE INPUT AND BUILD AST
        ANTLRInputStream input = new ANTLRInputStream(System.in);
        CMinusLexer lexer = new CMinusLexer(input);       // create lexer
        // create a buffer of tokens pulled from the lexer
        // Must use TokenRewriteStream not CommonTokenStream!
        TokenRewriteStream tokens = new TokenRewriteStream(lexer);
        CMinusParser parser = new CMinusParser(tokens);   // create parser
        CMinusParser.program_return r = parser.program(); // parse program



        // WALK TREE AND REWRITE TOKEN BUFFER
        // get the tree from the return structure for rule prog
        CommonTree t = (CommonTree)r.getTree();
        // create a stream of tree nodes from AST built by parser
        CommonTreeNodeStream nodes = new CommonTreeNodeStream(t);
        // tell it where it can find the token objects
        nodes.setTokenStream(tokens);
        Gen gen = new Gen(nodes);
        gen.program(); // invoke rule program
        System.out.println(tokens.toString()); // emit tweaked token buffer

    }
}
