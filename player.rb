class Player
  attr_accessor :hits, :misses

  def initialize
    @grid = Grid.new
    @ships = []
    @shots = []
    @hits = []
    @misses = []
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
