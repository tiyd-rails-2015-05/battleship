
class Grid
  attr_reader :ships

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
    if @ships.empty?
      empty_grid
    else
     ready_grid
    end
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

  def ready_grid
  puts  %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A | O | O | O | O |   |   |   |   |   |   |
B |   |   |   |   |   | O |   |   |   |   |
C |   |   |   |   |   | O |   |   |   |   |
D |   |   |   |   |   | O | O | O | O |   |
E |   |   |   |   |   | O |   |   |   |   |
F |   |   | O | O |   | O |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   | O | O | O |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
}
  end

  def fire_at(x_loc, y_loc)
    if @ships.empty? || x_loc > 10 || y_loc > 10
      false
    elsif @ships.include?([x_loc, y_loc])
    end
  end




end
