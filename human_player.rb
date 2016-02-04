require './grid.rb'
require './game.rb'
require './player.rb'

def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  attr_reader :name, :grid, :ships, :hits, :misses

  def initialize(name = "Dave")
    @name = name
    @grid = Grid.new
    @ships = []
    @hits = []
    @misses = []
  end

  def place_ships(lengths)
    lengths.each do |s|
      @ships << Ship.new(s)
      continue = false
      if place_ship_loop(s) == false
        place_ship_loop(s)
      end
    end
  end

  def place_ship_loop(s)
    puts "#{name}, where would you like to place a ship of length #{s}?"
    placement = get_user_input
    puts "Across or Down?"
    orientation = get_user_input

    x_val = grid.x_of(placement)
    y_val = grid.y_of(placement)

    if orientation == "Across"
      dir = true
    else
      dir = false
    end

    if grid.place_ship(Ship.new(s), x_val, y_val, dir) == false
      puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
      return false
    end
  end

  def call_shot
    puts "#{name}, please enter the coordinates for your next shot (e.g. 'B10'):"
    shot = get_user_input
    while check_shot(shot) == false
      puts "#{name}, please enter the coordinates for your next shot (e.g. 'B10'):"
      shot = get_user_input
    end
    shot
  end

  def check_shot(shot)
    letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    numbers = (1..10)
    return false unless letters.include?(shot[0].downcase) && numbers.include?(shot[1..-1].to_i)
  end
end
