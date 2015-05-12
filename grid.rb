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

  def display #kudos to Turner for advice on this
    game_hash = {}
    ("A".."J").each do |row|
      game_hash[row] = Array.new
        (0..9).each do |column|
        game_hash[row][column] = false
      end
    end
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  " + "-" * 41
    game_hash.each do |key, row|
      string = ""
      row.each do |v|
        if v
          string += " 0 |"
        else
          string += "   |"
        end
      end
      puts key.to_s + " |" + string
    end
    puts "  " + "-" * 41
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
