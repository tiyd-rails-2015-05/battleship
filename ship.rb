class ShipAlreadyPlacedError < StandardError
end

class Ship
  attr_reader :length

  def initialize (length)
    @length = length
    @coverage = []
  end

  def place(x_loc, y_loc, orientation)
    if @x_start.nil?
      @x_start = x_loc
      @y_start = y_loc
      if orientation
        @orientation = "across"
        (@x_start..(@x_start + @length - 1)).each {|i| @coverage << [i, @y_start]}
      else
        @orientation = "down"
        (@y_start..(@y_start + @length - 1)).each {|i| @coverage << [@x_start, i]}
      end
    else
      false
    end
  end

  def covers?(x_loc, y_loc)
    if @coverage.include?([x_loc, y_loc])
      true
    else
      false
    end
  end

  def overlaps_with?(ship_name)
    @coverage.each do |item|
      x = item[0]
      y = item[1]
      if ship_name.covers?(x, y)
      return  true
      end
    end
    false
  end

  def fire_at(x_loc, y_loc)
    if @coverage.include?([x_loc, y_loc])
      true
    else
      false
    end
  end

  def sunk?(x_loc, y_loc)
    

end
