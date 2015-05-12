require 'byebug'

class Grid
  attr_reader :display, :ships

  def initialize
    @ships = []
  end

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

  def place_ship(ship, x, y, bool)
    ship.place(x, y, bool)
    @ships.each do |ship_2|
      if ship_2.overlaps_with?(ship)
        return false
      end
    end
    @ships.push(ship)
  end

  def has_ship_on?(x, y)
    @ships.each do |ship|
      if ship.covers?(x, y)
        return true
      end
    end
    false
  end

end
