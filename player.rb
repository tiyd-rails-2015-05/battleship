require './grid'

class Player
  def grid
    @grid = Grid.new
  end

  def ships
    @ships = []
  end
end
