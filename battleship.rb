class Player
end

class HumanPlayer < Player

  attr_reader :name

  def initialize(name)
    @name = name
  end
  
end

class ComputerPlayer < Player
end
