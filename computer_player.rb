require './grid.rb'

class ComputerPlayer < Player
  attr_accessor :grid

  def initialize
    @grid = Grid.new
  end

  def name
    "HAL 9000"
  end

end
