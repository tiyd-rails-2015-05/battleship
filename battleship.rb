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
  attr_reader :length
  def initialize(length)
    @length = length
    @placed_ship = []
  end

  def place (x, y, bool)
    if @placed_ship == []
      if bool == true
        (x..(x + @length - 1)).each do |i|
          @placed_ship << [i, y]
        end
      else
        (y..(y + @length - 1)).each do |i|
          @placed_ship << [x, i]
        end
      end
    end
  end

  def covers? (x, y)
    @placed_ship.include?([x,y])
  end
end
