require './ship.rb'
require './hole.rb'

class Grid

attr_reader :ships, :board, :shots, :hits

  def initialize
    @ships = []
    @board = {}
    @shots = []
    @hits = []
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

    @hits.each do |array|
      @board[array[1]][array[0]-1] = "hit"
    end

    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  " + "-" * 41
    letters = ("A".."J").to_a
    board.each do |key, row|
      letter = "#{letters[key-1]} "
      row.each do |v|
        if v == true
          letter += "| O "
        elsif v == "hit"
          letter += "| X "
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
    if @shots.include?([x, y])
      return false
    else
      @shots << [x, y]
    end

    hit = false
    @ships.each do |ship|
      if ship.covers?(x, y)
        hit = true
        ship.fire_at(x, y)
        break
      end
    end

    if hit
      @hits << [x, y]
      true
    end
  end

  def sunk?
    hits_to_win = 0
    @ships.each do |ship|
      hits_to_win += ship.length
    end
    if hits_to_win == @hits.length && hits_to_win != 0
      return true
    end
  end

  def x_of(guess)
    if guess[-1] != "0"
      guess[1].to_i
    else
      10
    end
  end

end
