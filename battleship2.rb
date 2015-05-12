require './battleship_test.rb'

class Player
end



class HumanPlayer < Player
attr_reader :name
  def initialize(name = "Dave")
    @name = name
  end
end



class ComputerPlayer < Player
attr_reader :name
  def initialize
    @name = "HAL 9000"
  end
end

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
          @placed_ship << [Hole.new(i, y)]
        end
      else
        (y..(y + @length - 1)).each do |i|
          @placed_ship << [Hole.new(x, i)]
        end
      end
    end
  end

  def covers?(x, y)
    @placed_ship.include?([@x_axis,@y_axis])
  end

  def overlaps_with?(check_ship)
    @placed_ship.length.times.each do |i|
        if  check_ship.covers?(@placed_ship[i-1][0],@placed_ship[i-1][1]) == true
          return true
          exit loop
        end
    end
    return false
  end

  def fire_at(x, y)
    covers?(x,y)
  end

end

class Hole
  attr_reader :x, :y, :hit
  def initialize(x,y)
    @x_axis = x
    @y_axis = y
    @hit = false
  end
end
