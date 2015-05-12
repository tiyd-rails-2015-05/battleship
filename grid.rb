require 'byebug'

class Grid
  attr_reader :board

  def initialize
    @board = []
  end

  def has_ship_on?(x, y)
    if @board == []
      return false
    else
      @board.each do |h|
        h.each do |s|
          return true if s.spot == [x, y]
        end
      end
      return false
    end
  end

  def place_ship(new_ship, x, y, horz)
    new_ship.place(x, y, horz)
    # new_ship.holes.each do |h|
    #   @board << h.spot
    # end
    @board << new_ship.holes
  end

  def display
    puts "    1   2   3   4   5   6   7   8   9   10
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
  -----------------------------------------"

  end

end
