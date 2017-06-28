grammar memoize;
options {memoize=true;}

a : (e ';')=> e ';'
  | e '.'
  ;
 
e : ('(' e ')' e)=> '(' e ')' e  // type cast
  | '(' e ')'            // nested expression
  | ID
  ;

ID: 'a'..'z'+ ;
