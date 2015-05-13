require './grid.rb'
require './player.rb'
require './ship.rb'

def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  attr_accessor :name
  def initialize(name = "Dave")
    super()
    @name = name
  end

  def place_ships(lengths_to_place)
    lengths_to_place.each do |length|
      placed = false
      until placed do
        new_ship = Ship.new(length)
        puts "#{@name}, where would you like to place a ship of length #{length}?"
        coordinate = @grid.xy_of(get_user_input)
        puts "Across or Down?"
        orientation = get_user_input
        horizontal = (orientation == "Across")
        new_ship.place(coordinate, horizontal)
        if new_ship.locations.any? {|l| @grid.has_ship_on?([l[0], l[1]])}
          puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
        else
          @grid.place_ship(new_ship, coordinate, horizontal)
          @ships << new_ship
          placed = true
        end
      end
    end
  end

  def call_shot
    puts "#{@name}, please enter the coordinates for your next shot (e.g. 'B10'):"
    shot = @grid.xy_of(get_user_input)
    @shots << shot
    shot
  end

  def display_shots_grid
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  " + "-" * 41
    letter = ('A'..'J').to_a
    (1..10).each do |row|
      draw_row = "#{letter[row-1]} "
      (1..10).each do |column|
        if @hits.include?([column, row])
          draw_row += "| + "
        elsif @misses.include?([column, row])
          draw_row += "| - "
        else
          draw_row += "|   "
        end
      end
      draw_row += "|"
      puts draw_row
    end
    puts "  " + "-" * 41
  end
end
