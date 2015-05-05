/*
 *	Turing Machine Language Parser
 * 
 *	Parses tuples of the following form: 
 *      <current symbol> <new symbol> <direction> <new state>
 *  Grouped on blocks:
 *      [<current state>] { <tuples ...> }
 * 	
 * 	Grammar idea based on http://morphett.info/turing/turing.html
 * 
 *  To test:
 *      antlr4 TuringMachine.g4; javac *.java; grun TuringMachine r -gui
 * 
 */

grammar TuringMachine;

r           :   
    statedef+;

statedef    :   
    SN_BEG 
    statename 
    SN_END 
    STATE_BEG 
    tuple+ 
    STATE_END;

tuple       :   
    symbol 
    symbol 
    dir 
    statename;

statename   :   
    ALPNUM_PLUS;

symbol      :   
    ALPNUM  | 
    UNDERSC | 
    WILDCARD|
    MISC     ;

dir         :   
    (
        'l' | 
        'r' | 
        '*'
    );

SN_BEG      :   
    '[';
SN_END      :   
    ']';

STATE_BEG   :   
    '{';
STATE_END   :   
    '}';

ALPNUM      :   
    [A-Za-z0-9];
ALPNUM_PLUS  :   
    ALPNUM | 
    ALPNUM+;

WHITESP     :   
    [ \t\r\n]+ -> skip;

WILDCARD    :   
    '*';
UNDERSC     :   
    '_';

MISC        :
    ':'     |
    ')'     |
    '('     ;

ANYCHAR     :
    .;

COMMENT     :   
    '/*'
    .*?
    '*/'
    ->
    skip;   //  Ignore C-style /**/ comments
