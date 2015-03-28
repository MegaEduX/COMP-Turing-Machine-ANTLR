grammar TuringMachine;

/*
 *	Turing Machine Language Parser
 * 
 *	Parses tuples of the following form: <current state> <current symbol> <new symbol> <direction> <new state>
 * 	
 * 	
 * 	(grammar idea based on http://morphett.info/turing/turing.html)
 */

r		:	row+								;

row		:	state symbol symbol dir state	;

state	:	STATE							;
STATE	:	[A-Za-z0-9]+						;

symbol	:	SYMBOL							;
SYMBOL	:	~[ \t\r\n]+						;

dir		:	'l' | 'r' | '*'					;

WHITESP	:	[ \t\r\n]+	->	skip 			;