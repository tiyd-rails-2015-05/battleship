class Ship
  require './hole.rb'
  attr_reader :length, :place, :ship_locations, :hole_array

  def initialize(length)
    @length = length
    @place = false
    @ship_locations = []
    @hole_array = []
  end

  def place(x, y, orientation=true)
    if @place == false
      @place = [x, y, orientation]
      x_start = @place[0]
      y_start = @place[1]
      if orientation == true
        (x_start..x_start + @length-1).each do |x|
          @hole_array << Hole.new(x, y_start)
          location = [x, y_start]
          @ship_locations << location
        end
      else
        (y_start..y_start + @length -1).each do |y|
          @hole_array << Hole.new(x_start, y)
          location = [x_start, y]
          @ship_locations << location
        end
      end
    end
  end

  def covers?(x, y)
    @ship_locations.include?([x, y])
  end

  def overlaps_with?(other_ship)
    !(@ship_locations & other_ship.ship_locations == [])
  end

  def fire_at(x, y)
    if @ship_locations.include?([x, y])
      @hole_array.each do |hole|
          hole.hit?(x, y)
      end
    end
  end

  def sunk?
    check_sunk = []
    @hole_array.each do |hole|
      check_sunk << hole.hit
      end
    if check_sunk.include?(false)
      return false
    else
      return true
    end
  end

end
# un-comment to see the result of running test 13
# ship = Ship.new(2)
# ship.place(2, 1, true)
# p ship.hole_array
#
#
# puts ship.sunk?
# ship.fire_at(2, 1)
# puts ship.sunk?
# ship.fire_at(3, 1)
# puts ship.sunk?
# p ship.hole_array
