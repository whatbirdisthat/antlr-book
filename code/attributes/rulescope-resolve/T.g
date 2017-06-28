grammar T;

@members {
boolean isDefined(String id) {
    int level = $block.size();
    for (int s=level-1; s>=0; s--) {
        if ( $block[s]::symbols.contains(id) ) {
            System.out.println(id+" found in nesting level "+(s+1));
            return true;
        }
    }
    return false;
}
}

prog:   block
    ;
block
scope {
    List symbols;
}
@init {
    $block::symbols = new ArrayList();
}
@after {
    System.out.println("symbols level "+$block.size()+" = "+$block::symbols);
}
    :   '{' decl* stat+ '}'
    ;
decl:   'int' ID {$block::symbols.add($ID.text);} ';'
    ;
stat:   ID '=' INT ';'
        {
        if ( !isDefined($ID.text) ) {
            System.err.println("undefined variable level "+$block.size()+": "+$ID.text);
        }
        }
    |   block
    ;
ID  :   'a'..'z'+ ;
INT :   '0'..'9'+ ;
WS  :   (' '|'\n'|'\r')+ {$channel = HIDDEN;} ;

