grammar TuringMachine;

/*
 *	Turing Machine Language Parser
 * 
 *	Parses tuples of the following form: <current state> <current symbol> <new symbol> <direction> <new state>
 * 	
 *  Example Line: foo 0 _ * bar
 * 	
 * 	(grammar idea based on http://morphett.info/turing/turing.html)
 */

r           :   row+                            ;

row         :   state symbol symbol dir state   ;

state       :   ALPNUMPLUS                      ;

symbol      :   ALPNUM  |   '_' |   WILDCARD    ;

dir         :   ('l' | 'r' | '*')               ;

ALPNUM      :   [A-Za-z0-9]                     ;
ALPNUMPLUS  :   ALPNUM+                         ;

WHITESP     :   [ \t\r\n]+      ->  skip        ;
WILDCARD    :   '*';

COMMENT     :   '/*' .*? '*/'   ->  skip        ;   //  Ignore C-style /**/ comments
