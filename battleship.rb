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
  attr_reader :spot, :hit
  def initialize(x,y)
    @spot = [x,y]
    @hit = false
    #p @spot
  end
end

class Grid

  def has_ship_on?(x, y)
    false
    #@placed_ship.covers?(x,y)
  end

  def place_ship(new_ship, x, y, bool)
    @ship = new_ship
    @ship.place(x, y, bool)
    #p new_ship
  end

  def display
    puts "    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   |   |   |   |   |   |   |   |   |   |
B |   |   |   |   |   |   |   |   |   |   |
C |   |   |   |   |   |   |   |   |   |   |
D |   |   |   |   |   |   |   |   |   |   |
E |   |   |   |   |   |   |   |   |   |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
"

  end

end
