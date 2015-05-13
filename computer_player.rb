require "./player.rb"

class ComputerPlayer < Player
  attr_reader :name, :ships, :grid
  def initialize
    @name = "HAL 9000"
    @grid = Grid.new
    @ships = []
  end

  def place_ships(array)
    @ships = array.map{|x| Ship.new(x)}
    # Another ways of writing this
    # array.each{|x| @ships << Ship.new(x)}
    puts "HAL 9000 has placed its ships."
  end

  def call_shot
    "A4"
  end

end
