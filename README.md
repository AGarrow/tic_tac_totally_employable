# Tic Tac Totally Employable!

A tic tac toe game of variable grid size with an unbeatable computer.

## Running: 
run the following:


`gem install tic_tac_totally_employable`


`tic_tac_totally_employable`

thats it!

## Win detection:
Since this game is supposed to be run on a variable grid size, I wanted a win detection algorithm that would run in constant time. Since the last move is known to us, and any new win condition must include the last possible win, this algorithm checks if there are three consecutive matching symbols in a vertical, horizontal, or diagonal line, extending two cells (or fewer, if its against the edge of the board) away from the last move.

## The Computer:
The computer makes its moves using the [minimax algorithm](https://en.wikipedia.org/wiki/Minimax), with [alpha-beta pruning](https://en.wikipedia.org/wiki/Alpha%E2%80%93beta_pruning) for enhanced performance. It's pretty quick in a game of 3 rows / columns, but runtime suffers in larger games.
