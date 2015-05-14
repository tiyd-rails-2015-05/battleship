require 'byebug'
require './ship.rb'

class Grid
  attr_reader :board

  def initialize
    @board = []
    @ships = []
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
    new_ship.place(x, y, horz)
    if @ships.empty?
      @board << new_ship.holes
      @ships << new_ship
    else
      if @ships.any? {|s| s.overlaps_with?(new_ship)}
        false
      else
        @board << new_ship.holes
        @ships << new_ship
      end

    end
  end

  def display
    letters = ["A","B","C","D","E","F","G","H","I","J"]
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  -----------------------------------------"
    # p "....................."
    # p @ships


    10.times do |c|
      board_line = "#{letters[c]} |"
      10.times do |r|
        if has_ship_on?(r+1,c+1) && @board.any?{|holes| holes.any?{ |s|  s.hit == true && s.spot == [r+1,c+1] }}
          board_line += " X |"
        elsif has_ship_on?(r+1,c+1)
          board_line += " O |"
        else
          board_line += "   |"
        end
      end
      puts board_line
    end
    puts "  -----------------------------------------"
  end

  def fire_at(x,y)
    if has_ship_on?(x,y)
      @board.each do |h|
        h.each do |s|
          if s.spot == [x, y]
            if s.hit == false
              s.hit_it
            else
              return false
            end
          end
        end
      end
    else
      false
    end
  end

  def sunk?
    if @board.empty?
      return false
    else
      if @board.any? { |h| h.any? {|s| s.hit == false }}
        return false
      else
        return true
      end
    end
 end

end
