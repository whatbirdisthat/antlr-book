/***
 * Excerpted from "The Definitive ANTLR Reference",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/tpantlr for more book information.
***/
import org.antlr.runtime.tree.*;

public class XYZList {
    public static void main(String[] args) {
        int ID = 1; // define a fictional token type
        // create a tree adapter to use for tree construction
        TreeAdaptor adaptor = new CommonTreeAdaptor();
        // a list has no root, creating a nil node
        CommonTree list = (CommonTree)adaptor.nil();
        // create a Token with type ID, text "x" then use as payload
        // in AST node; this variation on create does both.
        list.addChild((CommonTree)adaptor.create(ID,"x"));
        list.addChild((CommonTree)adaptor.create(ID,"y"));
        list.addChild((CommonTree)adaptor.create(ID,"z"));
        // recursively print the tree using ANTLR notation
        // ^(nil x y z) is shown as just x y z
        System.out.println(list.toStringTree());
    }
}
