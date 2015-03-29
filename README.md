# Turing Machine (ANTLR Language Specification)

---

## Testing

	$ antlr4 TuringMachine.g4 
	$ javac *.java
	$ grun TuringMachine r -gui

---

## Syntax

- Each line should contain one tuple of the form '[current state] [current symbol] [new symbol] [direction] [new state]'.
- You can use any number or word for [current state] and [new state], eg. 10, a, state1. State labels are case-sensitive.
- You can use any character for [current symbol] and [new symbol], or '_' to represent blank (space). Symbols are case-sensitive.
- [direction] should be 'l', 'r' or '*', denoting 'move left', 'move right' or 'do not move', respectively.
- /* Comments are C-Style. */