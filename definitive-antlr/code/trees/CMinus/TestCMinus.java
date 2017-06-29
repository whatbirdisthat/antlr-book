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

public class TestCMinus {
    public static void main(String[] args) throws Exception {

        // Create input stream from standard input
        ANTLRInputStream input = new ANTLRInputStream(System.in);
        // Create a lexer attached to that input stream
        CMinusLexer lexer = new CMinusLexer(input);
        // Create a stream of tokens pulled from the lexer
        CommonTokenStream tokens = new CommonTokenStream(lexer);

        // Create a parser attached to the token stream
        CMinusParser parser = new CMinusParser(tokens);
        // Invoke the program rule in get return value
        CMinusParser.program_return r = parser.program();
        CommonTree t = (CommonTree)r.getTree();

        // If -dot option then generate DOT diagram for AST
        if ( args.length>0 && args[0].equals("-dot") ) {
            DOTTreeGenerator gen = new DOTTreeGenerator();
            StringTemplate st = gen.toDOT(t);
            System.out.println(st);
        }
        else {
            System.out.println(t.toStringTree());
        }
        // Walk resulting tree; create treenode stream first
        CommonTreeNodeStream nodes = new CommonTreeNodeStream(t);
        // AST nodes have payloads that point into token stream
        nodes.setTokenStream(tokens); 
        // Create a tree Walker attached to the nodes stream
        CMinusWalker walker = new CMinusWalker(nodes);
        // Invoke the start symbol, rule program
        walker.program();

    }
}
