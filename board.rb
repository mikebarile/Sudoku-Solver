require "colorize"
require_relative "tile"

class Board

  attr_reader :grid

  def initialize(file)
    @grid = populate_board(file)
  end

  def populate_board(file)
    rows = File.readlines(file).map(&:chomp)
    grid = rows.map do |row|
      vals = row.split("").map { |char| char.to_i }
      vals.map { |num| Tile.new(num) }
    end

    grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    tile = @grid[row][col]
    tile.value = value
  end

  def rows
    @grid
  end

  def columns
    rows.transpose
  end

  def square(idx)
    tiles = []
    x = (idx / 3) * 3
    y = (idx % 3) * 3

    (x...x + 3).each do |i|
      (y...y + 3).each do |j|
        tiles << self[[i, j]]
      end
    end

    tiles
  end

  def squares
    (0..8).to_a.map { |i| square(i) }
  end

  def render
    puts "  #{(0..8).to_a.join(" ").colorize(:blue)}"
    grid.each_with_index do |row, idx|
      puts "#{idx.to_s.colorize(:blue)} #{row.join(" ")}"
    end
  end

  def size
    grid.size
  end

  def solved?
    rows.all? { |row| set_solved?(row) } &&
      columns.all? { |col| set_solved?(col) } &&
      squares.all? { |square| set_solved?(square) }
  end

  def set_solved?(tiles)
    vals = tiles.map(&:value)
    vals.sort == (1..9).to_a
  end

  def size
    @grid.size
  end

  def dup
    duped_grid = grid.map do |row|
      row.map {|tile| Tile.new(tile.value)}
    end

    Board.new(duped_grid)
  end

end
