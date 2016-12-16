require_relative "solver"

puts "Please enter a file name"
file = gets.chomp

solver = Solver.new(Board.new(file))
puts "\n"
puts "This is the original board:"
solver.board.render

solver.solve!
solver.update_board

puts "\n"
puts "This is the solved board:"
solver.board.render
