grammar unreachable;

slist
  : (var)=>var ';' {System.out.println("slist alt 1");}
  |            ';' {System.out.println("slist alt 2");}
  ;

var
  : 'int' ID       {System.out.println("match var");}
  |                {System.out.println("bypass var");}
  ;

ID: 'a'..'z'+ ;
WS: (' '|'\n'|'\r')+ {skip();} ;

