require './grid.rb'

class ComputerPlayer < Player
  attr_reader :name, :grid, :ships

  def initialize
    @name = "HAL 9000"
    @grid = Grid.new
    @ships = []
  end

  def place_ships(lengths)
    lengths.each do |s|
      @ships << Ship.new(s)

      x_val = rand(1..10)
      y_val = rand(1..10)
      random_number = rand(1..2)
      if random_number == 1
        dir = true
      else
        dir = false
      end

      grid.place_ship(Ship.new(s), x_val, y_val, dir)
    end


    puts "HAL 9000 has placed its ships."
  end

  def call_shot
    row = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"].sample
    column = rand(1..10).to_s
    row+column
  end


end
