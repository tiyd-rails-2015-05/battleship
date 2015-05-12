require './grid.rb'
require './player.rb'
require './ship.rb'

def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  attr_accessor :name
  def initialize(name = "Dave")
    @name = name
  end

  def place_ships(lengths_to_place)
    lengths_to_place.each do |length|
      placed = false
      until placed do
        new_ship = Ship.new(length)
        puts "#{@name}, where would you like to place a ship of length #{length}?"
        coordinate = get_user_input
        puts "Across or Down?"
        orientation = get_user_input
        horizontal = (orientation == "Across")
        p coordinate
        new_ship.place(@grid.x_of(coordinate), @grid.y_of(coordinate), horizontal)

        if new_ship.location.any? {|l| @grid.has_ship_on?(l[0], l[1])}
          puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
        else
          @grid.place_ship(new_ship, @grid.x_of(coordinate), @grid.y_of(coordinate), horizontal)
          @ships << new_ship
          placed = true
        end
      end
    end
  end
end
