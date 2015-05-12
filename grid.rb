
class Grid
  def initialize
    @ships = []
  end

  def has_ship_on?(x_loc, y_loc)
    @ships.each do |s|
      return true if s.covers?(x_loc, y_loc)
    end
    false
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
    @overlapping = false
    @ships.each do |s|
      @overlapping = true if s.overlaps_with?(ship)
    end
    #something using each which sets overlapping
    if @overlapping
      false
    else
      @ships << ship
      true
    end
  end




end
