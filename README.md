Turing Machine (ANTLR Language Specification)
=============================================


Testing
-------

	$ antlr4 TuringMachine.g4 
	$ javac *.java
	$ grun TuringMachine r -gui


Syntax
------

- Each line should contain one tuple of the form '<current state> <current symbol> <new symbol> <direction> <new state>'.
- You can use any number or word for <current state> and <new state>, eg. 10, a, state1. State labels are case-sensitive.
- You can use any character for <current symbol> and <new symbol>, or '_' to represent blank (space). Symbols are case-sensitive.
- <direction> should be 'l', 'r' or '*', denoting 'move left', 'move right' or 'do not move', respectively.
- Anything after a ';' is a comment and is ignored.
- The machine halts when it reaches any state starting with 'halt', eg. halt, halt-accept.


Example
-------

	; This example program checks if the input string is a binary palindrome.
	; Input: a string of 0's and 1's, eg '1001001'
	
	
	; Machine starts in state 0.
	
	; State 0: read the leftmost symbol
	0 0 _ r 1o
	0 1 _ r 1i
	0 _ _ * accept     ; Empty input
	
	; State 1o, 1i: find the rightmost symbol
	1o _ _ l 2o
	1o * * r 1o
	
	1i _ _ l 2i
	1i * * r 1i
	
	; State 2o, 2i: check if the rightmost symbol matches the most recently read left-hand symbol
	2o 0 _ l 3
	2o _ _ * accept
	2o * * * reject
	
	2i 1 _ l 3
	2i _ _ * accept
	2i * * * reject
	
	; State 3, 4: return to left end of remaining input
	3 _ _ * accept
	3 * * l 4
	4 * * l 4
	4 _ _ r 0  ; Back to the beginning
	
	accept * : r accept2
	accept2 * ) * halt-accept
	
	reject _ : r reject2
	reject * _ l reject
	reject2 * ( * halt-reject

