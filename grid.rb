
class Grid
  def initialize
    @ship_coordinates = []

  end

  def has_ship_on?(x_loc, y_loc)
    if @ship_coordinates.include?([x_loc, y_loc])
      true
    else
      false
    end
  end

  def display
    empty_grid
  end

  def empty_grid
  puts  %Q{    1   2   3   4   5   6   7   8   9   10
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

  def place_ship(ship, x_loc, y_loc, orientation)
    ship.place(x_loc, y_loc, orientation)
      @ship_coordinates = ship.coverage
  end
end
