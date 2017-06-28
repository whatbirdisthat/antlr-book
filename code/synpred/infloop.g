grammar infloop;

slist
  : ( (var)=> var {System.out.println("in loop");} )+
  ;

var
  : 'int' ID ';' {System.out.println("match var");}
  |              {System.out.println("bypass var");}
  ;

ID: 'a'..'z'+ ;
WS: (' '|'\n'|'\r')+ {skip();} ;
