require './grid.rb'

class HumanPlayer < Player
  attr_reader :name, :grid

  def initialize(name = "Dave")
    @name = name
    @grid = Grid.new
  end
end
