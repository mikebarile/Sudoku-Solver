require_relative "board"
require_relative "solver"

p "Please enter a file name"
file = gets.chomp

board = Board.new(file)
p "This is the original board:"
board.render
