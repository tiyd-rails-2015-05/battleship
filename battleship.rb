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

ship1 = Ship.new(4)
ship1.place(2, 1, true)
ship2 = Ship.new(4)
ship2.place(3, 1, true)
ship3 = Ship.new(4)
ship3.place(2, 1, false)

# p ship1.overlaps_with?(ship2)
# p ship1.overlaps_with?(ship3)
# p ship2.overlaps_with?(ship3)
