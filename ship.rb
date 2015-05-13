class Ship
  attr_reader :length, :locations

  def initialize(length)
    @length = length
    @placed = false
    @locations = []
  end

  def place(coordinate, horizontal)
    x = coordinate[0]
    y = coordinate[1]
    if @placed == false
      @length.times { |spot| @locations << (horizontal ? [x + spot, y] : [x, y + spot]) }
      @placed = true
    end
  end

  def covers?(coordinate)
    @locations.include?(coordinate)
  end

  def overlaps_with?(ship)
    !(@locations & ship.locations).empty?
  end

  def fire_at(coordinate)
    @locations.delete(coordinate)
  end

  def sunk?
    @placed == true && @locations.empty?
  end
end
