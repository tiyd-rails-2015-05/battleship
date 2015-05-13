require 'byebug'
require './ship.rb'

class Grid
  attr_reader :board

  def initialize
    @board = []
  end

  def has_ship_on?(x, y)
      @board.each do |h|
        h.each do |s|
          return true if s.spot == [x, y]
        end
      end
      return false
  end

  def place_ship(new_ship, x, y, horz)
    @ship = new_ship
    new_ship.place(x, y, horz)
    @ship.each do |s|
      if s.spot ==
        @board.each do |h|
          h.each do |i|
            i.spot
          end
        end
      end
    end
    @board << new_ship.holes
    #p @ship
    #p @board

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
