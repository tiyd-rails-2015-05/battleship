class Grid

require './ship.rb'
require './hole.rb'
attr_reader :display, :ships

  def initialize
    @display = display
    @ships = []
  end

  def has_ship_on?(x, y)
    on = false
    @ships.each do |ship|
      if ship.covers?(x, y)
        on = true
        break
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
    overlapping = false
    @ships.each do |placed_ship|
      if placed_ship.overlaps_with?(ship)
        overlapping = true
        break
      end
    end

    if overlapping
      false
    else
      @ships << ship
      true
    end
  end

end

grid = Grid.new
grid.place_ship(Ship.new(4), 3, 3, true)
p grid.ships
grid.place_ship(Ship.new(4), 1, 3, true)
p grid.ships
# # grid.place_ship(Ship.new(4), 4, 3, true)
# # grid.place_ship(Ship.new(4), 4, 2, false)
# # grid.place_ship(Ship.new(4), 7, 7, true)
