class Grid
  attr_reader :display

  def display
  puts  "    1   2   3   4   5   6   7   8   9   10"
  puts "  -----------------------------------------"
  puts "A |   |   |   |   |   |   |   |   |   |   |"
  puts "B |   |   |   |   |   |   |   |   |   |   |"
  puts "C |   |   |   |   |   |   |   |   |   |   |"
  puts "D |   |   |   |   |   |   |   |   |   |   |"
  puts "E |   |   |   |   |   |   |   |   |   |   |"
  puts "F |   |   |   |   |   |   |   |   |   |   |"
  puts "G |   |   |   |   |   |   |   |   |   |   |"
  puts "H |   |   |   |   |   |   |   |   |   |   |"
  puts "I |   |   |   |   |   |   |   |   |   |   |"
  puts "J |   |   |   |   |   |   |   |   |   |   |"
  puts "  -----------------------------------------"
  end

  def place_ship(ship_object, x, y, bool)
    @ship = ship_object
    @ship.place(x, y, bool)
  end

  def has_ship_on?(x, y)
    if @ship.nil?
      return false
    else
      @ship.covers?(x, y)
    end
  end

end
