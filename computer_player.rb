require './grid.rb'
require './player.rb'

class ComputerPlayer < Player
  attr_reader :name, :grid, :ships, :hits, :misses

  def initialize
    @name = "HAL 9000"
    @grid = Grid.new
    @ships = []
    @hits = []
    @misses = []
  end

  def place_ships(lengths)
    lengths.each do |s|
      @ships << Ship.new(s)

      x_val = rand(1..10)
      y_val = rand(1..10)

      if x_val + s > 10 && y_val + s > 10
        x_val -= s
        y_val -= s
        orientation = rand(1..2)
      elsif x_val + s > 10
        orientation = 2
      elsif y_val + s > 10
        orientation = 1
      else
        orientation = rand(1..2)
      end
      
      if orientation == 1
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
