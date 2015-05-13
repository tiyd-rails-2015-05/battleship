require './grid.rb'

def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  attr_reader :name, :grid, :ships

  def initialize(name = "Dave")
    @name = name
    @grid = Grid.new
    @ships = []
  end

  def place_ships(coords)
    coords.each do |s|
      @ships << Ship.new(s)
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
      grid.place_ship(Ship.new(s), x_val, y_val, dir)

    end

  end

end
