class Player
  def initialize
    @grid = Grid.new
    @ships = []
    @shots = []
  end

  def grid
    @grid
  end

  def ships
    @ships
  end

  def shots
    @shots
  end
end
