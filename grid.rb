class Grid

require './ship.rb'
require './hole.rb'
attr_reader :display, :empty_grid

  def initialize
    @display = display
    @ships = []
  end

  def has_ship_on?(x, y)
    on = false
    @ships.each do |ship|
      if ship.covers?(x, y)
        on = true
      end
    end
    return on
  end

  def display
    puts empty_grid
  end

  def empty_grid
    %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   |   |   |   |   |   |   |   |   |   |
B |   |   |   |   |   |   |   |   |   |   |
C |   |   |   |   |   |   |   |   |   |   |
D |   |   |   |   |   |   |   |   |   |   |
E |   |   |   |   |   |   |   |   |   |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
}
  end

  def place_ship(ship, x, y, orientation=true)
    ship.place(x, y, orientation)
    @ships<<ship
  end

  grid = Grid.new
  grid.place_ship(Ship.new(4), 3, 3, true)
  grid.has_ship_on?(2, 3)
  grid.has_ship_on?(3, 3)
  grid.has_ship_on?(4, 3)
  grid.has_ship_on?(6, 3)
  grid.has_ship_on?(7, 3)
  grid.has_ship_on?(5, 4)

end
