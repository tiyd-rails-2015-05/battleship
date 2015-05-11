class ShipAlreadyPlacedError < StandardError
end

class Ship
  attr_reader :length

  def initialize (length)
    @length = length
    @array = []
  end

  def place(x_loc, y_loc, orientation)
    @x_start = x_loc
    @y_start = y_loc
    if orientation
      @orientation = "across"
    else
      @orientation = "down"
   end
  #  @array = []
  #  if @array.empty?
  #    @array << x_loc
  #    @array << y_loc


  end

  def covers?(x_loc, y_loc)
    if @orientation == "across"
      @x_coverage = (@x_start..(@x_start + @length - 1)).to_a
      @y_coverage = [@y_start]
    else
      @x_coverage = [@x_start]
      @y_coverage = (@y_start..(@y_start + @length - 1)).to_a
    end

    if @x_coverage.include?(x_loc) && @y_coverage.include?(y_loc)
      true
    else
      false
    end
  end

end
