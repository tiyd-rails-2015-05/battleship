class Ship
  attr_reader :length, :placed_ship
  def initialize(length)
    @length = length
    @placed_ship = []
  end

  def place(x, y, bool)
    if @placed_ship == []
      if bool == true
        (x..(x + @length - 1)).each do |i|
          @placed_ship << Hole.new(i, y).spot
        end
      else
        (y..(y + @length - 1)).each do |i|
          @placed_ship << Hole.new(x, i).spot
        end
      end
    end
  end

  def covers?(x, y)
    @placed_ship.include?([x,y])
  end

  def overlaps_with?(check_ship)
    @placed_ship.length.times do |i|
        if  check_ship.covers?(@placed_ship[i-1][0],@placed_ship[i-1][1]) == true
          return true
          exit loop
        end
    end
    return false
  end

  def fire_at(x, y)
    if covers?(x,y)
      p @spot
      @hit = true
    end
  end

end
