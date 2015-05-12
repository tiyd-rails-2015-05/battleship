class ShipAlreadyPlacedError < StandardError
end

class Ship
  attr_reader :length, :coverage

  def initialize (length)
    @length = length
    @coverage = []
    @hits = []
    @misses = []
  end

  def place(x_loc, y_loc, orientation)
    if @x_start.nil?
      @x_start = x_loc
      @y_start = y_loc
      if orientation
        @orientation = "across"
        (x_loc..(x_loc + @length - 1)).each {|i| @coverage << [i, y_loc]}
      else
        @orientation = "down"
        (y_loc..(y_loc + @length - 1)).each {|i| @coverage << [x_loc, i]}
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

  def overlaps_with?(other)
    @coverage.each do |item|
      x = item[0]
      y = item[1]
      if other.covers?(x, y)
        return  true
      end
    end
    false
  end

  def fire_at(x_loc, y_loc)
    if @coverage.include?([x_loc, y_loc])
      @hits << [x_loc, y_loc]
    elsif @coverage.empty?
      false
    elsif !@coverage.include?([x_loc, y_loc])
      @misses << [x_loc, y_loc]
      false
    end
  end

  def sunk?
    if @coverage == []
      false
    elsif @hits.sort == @coverage
      true
    end
  end


end
