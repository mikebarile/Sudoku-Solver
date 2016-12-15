require "colorize"

class Tile
  attr_reader :value

  def initialize(val)
    @value = val
    @provided = value != 0 ? true : false
  end

  def color
    @provided ? :green : :red
  end

  def to_s
    value == 0 ? " " : @value.to_s.colorize(color)
  end

  def value=(val)
    if @provided
      p "This tile's value can't be changed, please try again"
    else
      @value = val
    end
  end

end
