require "./hole.rb"
require "./grid.rb"
require "./ship.rb"

def get_user_input
  gets.chomp
end

class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class HumanPlayer < Player
  def initialize(name="Dave")
    @name = name
  end
end

class ComputerPlayer < Player
  def initialize
    @name = "HAL 9000"
  end
end

grid = Grid.new
p grid.place_ship(Ship.new(4), 3, 3, true)
# ship = Ship.new(2)
# ship.place(2, 1, true)
#
# p ship.sunk?
# ship.fire_at(2, 1)
# p ship.sunk?
# ship.fire_at(3, 1)
# p ship.sunk?
