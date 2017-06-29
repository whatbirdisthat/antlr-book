grammar b;
backtrack
    :	(cast ';')=> cast ';'
    |   (e ';')=>    e ';'
    |                e '.'
    ;

cast:   '(' ID ')' ;
	
e   :   '(' e ')'
    |   ID
	;

ID  :   'a'..'z'+ ;
