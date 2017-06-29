lexer grammar XML;

@members {
    boolean tagMode = false;
}

// START:tags
/** Match the start of a tag; turn on tagMode. */
TAG_START_OPEN : '<' { tagMode = true; } ;

/** Match the start of a closing tag; turn on tagMode. */
TAG_END_OPEN   : '</' { tagMode = true; } ;

/** Match the end of a tag like </foo> or <foo>; turn off tagMode */
TAG_CLOSE      : { tagMode }?=> '>' { tagMode = false; } ;

/** Match the end of a single tag like <foo/>; turn off tagMode */
TAG_EMPTY_CLOSE: { tagMode }?=> '/>' { tagMode = false; } ;
// END:tags

// START:inside
ATTR_EQ : { tagMode }?=> '=' ;

ATTR_VALUE
    : { tagMode }?=>
      ( '"' (~'"')* '"'
      | '\'' (~'\'')* '\''
      )
    ;

WS  :  { tagMode }?=>
       (' '|'\r'|'\t'|'\u000C'|'\n') {$channel=HIDDEN;}
    ;

GENERIC_ID
    : { tagMode }?=>
      ( LETTER | '_' | ':') (NAMECHAR)*
    ;
// END:inside

// START:outside
/** Anything outside of a tag is PCDATA */
PCDATA : { !tagMode }?=> (~'<')+ ;
// END:outside

// START:helper
fragment NAMECHAR
    : LETTER | DIGIT | '.' | '-' | '_' | ':'
    ;

fragment DIGIT
    :    '0'..'9'
    ;

fragment LETTER
    : 'a'..'z'
    | 'A'..'Z'
    ;
// END:helper
