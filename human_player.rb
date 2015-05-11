require './grid.rb'

def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  attr_accessor :name, :grid

  def initialize(name = "Dave")
    @name = name
    @grid = Grid.new
  end

end
