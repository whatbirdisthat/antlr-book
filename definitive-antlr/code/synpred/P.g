lexer grammar T;
/** For input s followed by INT, match only s; must exec action1.
 *  For sx followed by INT, match only sx; exec action2.
 */
ID : ('s' INT)=> 's'                {action1;}
   | ('sx' INT)=> 'sx'              {action2;}
   | 'a'..'z' ('a'..'z'|'0'..'9')*  {action3;}
   ;
INT : '0'..'9'+ ;
