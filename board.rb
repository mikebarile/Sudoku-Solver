require "colorize"
require_relative "tile"

class Board

  attr_accessor :grid

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

  def square(pos)
    tiles = []
    idx = (pos[0] / 3)*3 + pos[1] / 3
    x = (idx / 3) * 3
    y = (idx % 3) * 3

    (x...x + 3).each do |i|
      (y...y + 3).each do |j|
        tiles << self[[i, j]]
      end
    end

    tiles
  end

  def render
    puts "  #{(0..8).to_a.join(" ").colorize(:blue)}"
    grid.each_with_index do |row, idx|
      puts "#{idx.to_s.colorize(:blue)} #{row.join(" ")}"
    end
  end

end
