require "colorize"
require 'csv'
require_relative "tile"

class Board

  attr_accessor :grid

  def initialize(file)
    @grid = populate_board(file)
  end

  def populate_board(file)
    rows = CSV.read(file)

    grid = rows.map do |row|
      vals = row.map { |char| char.to_i }
      vals.map { |num| Tile.new(num) }
    end

    grid
  end

  def render
    puts "  #{(0..8).to_a.join(" ").colorize(:blue)}"
    grid.each_with_index do |row, idx|
      puts "#{idx.to_s.colorize(:blue)} #{row.join(" ")}"
    end
  end

end
