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
    @ships.any? {|s| s.covers?(x, y)}
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

    if placements != []
      placements.each do |sub_array|
        sub_array.each do |array|
           @board[array[1]][array[0]-1] = true
        end
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
    if @ships.any? {|s| s.overlaps_with?(ship)}
      return false
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

    if @ships.any? {|s| s.covers?(x, y)}
      @hits << [x, y]
      true
    else
      false
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

  def y_of(guess)
    guess_hash = {"A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5,
                  "F" => 6, "G" => 7, "H" => 8, "I" => 9, "J" => 10}
    y = guess_hash[guess[0].upcase]
    return y
  end

end
