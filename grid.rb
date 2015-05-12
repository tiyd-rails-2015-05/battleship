class Grid

require './ship.rb'
require './hole.rb'
attr_reader :ships, :board

  def initialize
    @ships = []
    @board = {}
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
    @board = {}
    (1..10).each do |row|
      @board[row] = Array.new
        (0..9).each do |column|
        @board[row][column] = false
      end
    end

    placements = []
    @ships.each do |ship|
    placements << ship.ship_locations
    end

    placements.each do |sub_array|
      sub_array.each do |array|
         @board[array[1]][array[0]-1] = true
      end
    end


    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  " + "-" * 41
    letters = ("A".."J").to_a
    board.each do |key, row|
      letter = "#{letters[key-1]} "
      row.each do |v|
        if v
          letter += "| O "
        else
          letter += "|   "
        end
      end
      puts letter + "|"
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

  def fire_at(x, y)
  end

end
