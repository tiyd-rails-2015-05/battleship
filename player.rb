class Player
  attr_reader :hits, :misses, :grid, :ships, :shots

  def initialize
    @grid = Grid.new
    @ships = []
    @shots = []
    @hits = []
    @misses = []
  end

end
