require_relative "board"

class Solver

  attr_reader :board

  def initialize(board)
    @board = board
    @flat = flatten_board(board)
  end

  def flatten_board(board)
    flat_board = []
    board.grid.each { |row| flat_board.concat(row) }
    flat_board
  end

  def unflatten_board!
    new_board = Array.new(9) {Array.new}
    i = 0
    until new_board[8].length == 9
      until new_board[i].length == 9
        new_board[i].push(@flat.pop)
      end
      i += 1
    end
    @board.grid = new_board
  end

  def solve!
    #Identify first index w/ value 0
    idx = nil
    @flat.each_with_index do |tile, tile_idx|
      idx = tile_idx if tile.value == 0
    end
    return true unless idx

    #Iterate through potential guesses
    (1..9).each do |guess|
      @flat[idx].value = guess
      return @flat if board_valid?(idx) && solve!
    end

    #Reset value to 0 and move back up the tree
    @flat[idx].value = 0
    false
  end

  def board_valid?(idx)
    val = @flat[idx].value
    return false unless valid_row?(val, idx)
    return false unless valid_col?(val, idx)
    return false unless valid_square?(val, idx)
    true
  end

  def valid_row?(val, idx)
    row = idx / 9
    start_idx = row * 9
    (start_idx..(start_idx + 8)).each do |check_idx|
      return false unless valid?(check_idx, val, idx)
    end
    true
  end

  def valid_col?(val, idx)
    col = idx % 9
    start_idx = 0
    (1..9).each do
      check_idx = start_idx + col
      return false unless valid?(check_idx, val, idx)
      start_idx += 9
    end
    true
  end

  def valid_square?(val, idx)
    col_start, row_start = (((idx % 9) / 3) * 3), ((idx / 27) * 27)
    3.times do
      (col_start..(col_start + 2)).each do |col|
        return false unless valid?(col + row_start, val, idx)
      end
      row_start += 9
    end
  end

  def valid?(check_idx, val, idx)
    return false if check_idx != idx && val == @flat[check_idx].value
    true
  end

end
