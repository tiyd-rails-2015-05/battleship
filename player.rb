require './battleship_test.rb'

class Player
  attr_reader :grid
  
  def initialize
    @grid = Grid.new
  end

end
