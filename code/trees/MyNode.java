/***
 * Excerpted from "The Definitive ANTLR Reference",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/tpantlr for more book information.
***/
import org.antlr.runtime.tree.*;
import org.antlr.runtime.Token; 
                        
public class MyNode extends CommonTree {
    /** If this is an ID node, symbol points at the corresponding
     *  symbol table entry.
     */
    public Symbol symbol;

    public MyNode(Token t) {
	super(t);
    }               
}                       
