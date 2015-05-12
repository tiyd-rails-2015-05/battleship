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
