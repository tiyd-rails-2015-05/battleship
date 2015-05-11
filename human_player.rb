require './grid.rb'
require './player.rb'
require './ship.rb'

def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  attr_accessor :name, :grid, :ships

  def initialize(name = "Dave")
    @name = name
    @grid = Grid.new
    @ships = []
  end

  def place_ships(ships_to_place)
    ships_to_place.each do |ship|
      new_ship = Ship.new(ship)
      until new_ship.placed
        puts "#{@name}, where would you like to place a ship of length #{ship}?"
        coordinate = get_user_input
        puts "Across or Down?"
        orientation = get_user_input
        if orientation == "Down"
          orientation = false
        end
        if !@ships.empty?
          @ships.each do |test_ship|
            if test_ship.overlaps_with?(new_ship)
              puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
            end
          end
        else
          new_ship.place(@grid.x_of(coordinate), @grid.y_of(coordinate), orientation)
        end
      end
      @grid.place_ship(new_ship, @grid.x_of(coordinate), @grid.y_of(coordinate), orientation)
      @ships << new_ship
    end
  end

end
