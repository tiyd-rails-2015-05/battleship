require "./player.rb"

class HumanPlayer < Player
  attr_reader :name
  def initialize(name="Dave")
    @name = name
    @mygrid
  end

  def grid
    @mygrid = Grid.new
  end
  

end
