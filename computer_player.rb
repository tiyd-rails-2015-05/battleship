require "./player.rb"

class ComputerPlayer < Player
  attr_reader :name, :ships
  def initialize
    @name = "HAL 9000"
    @grid
    @ships = []
  end

  def grid
    @grid = Grid.new
  end

  def place_ships(array)
    @ships = array.map{|x| Ship.new(x)}
    # Another ways of writing this
    # array.each{|x| @ships << Ship.new(x)}
    puts "HAL 9000 has placed its ships."
  end


end
