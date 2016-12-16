# Sudoku Solver

Sudoku Solver is a Ruby script that solves a sudoku puzzle stored in a csv. Sudoku Solver uses a tree to recursively iterate through every tile with value "0" in the grid until it finds a valid solution. The program uses the following methodology to solve the puzzle:

1. "Flatten" the board into a single array
2. Find the first tile with value "0"
3. Iterate through guess values 1 - 9
4. If the guess value is valid, recursively set the remaining "0" value tiles
5. If a tile's sub tree fails to solve the puzzle, reset the tile's value to zero and move back up the tree

The program is broken into four components:

1. sudoku_solver.rb: The executive script
2. solver.rb: Contains all logic for solving the puzzle
3. board.rb: Contains logic for initializing and rendering the board
4. tile.rb: Contains logic for setting / formatting tiles

## Instructions

Follow these steps to run Sudoku Solver locally:

1. Clone this repo locally
2. Ensure that you have ruby installed ("brew install ruby")
3. Navigate into the directory via terminal
4. Ensure you have bundler installed ("gem install bundler")
5. Run "bundle install"
6. Enter the command "ruby lib/sudoku_solver.rb"
7. Enter a valid file name when prompted (sample.csv is included in the folder)
8. Bask in your elegantly solved Sudoku puzzle!
