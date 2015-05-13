class Player
  attr_reader :hits, :misses, :grid, :ships, :shots

  def initialize(width: 10, height: 10)
    @grid = Grid.new(width:width, height:height)
    @ships = []
    @shots = []
    @hits = []
    @misses = []
  end

  def ships
    @grid.ships
  end

end
