require './ship.rb'

class Grid
  attr_accessor :locations

  def initialize
    @locations = []
    @hits = []
  end

  def place_ship(ship, x, y, horizontal)
    @ship = ship
    @ship.place(x, y, horizontal)
    if !(@locations & @ship.location).empty?
      false
    else
      @locations += @ship.location
    end
  end

  def has_ship_on?(x, y)
    @locations.include?([x, y])
  end

  def display
    puts %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------}
    letter = ('A'..'J').to_a
    (1..10).each do |row|
      draw_row = "#{letter[row-1]} "
        (1..10).each do |column|
          if @locations.include?([column, row])
            draw_row += "| O "
          elsif @hits.include?([column, row])
            draw_row += "| X "
          else
            draw_row += "|   "
          end
        end
        draw_row += "|"
        puts draw_row
    end
    puts "  -----------------------------------------"
  end

  def fire_at(column, row)
    if @locations.include?([column, row]) && !@hits.include?([column, row])
      @locations.delete([column, row])
      @hits << [column, row]
    end
  end

  def sunk?
    @locations.empty? && !@hits.empty?
  end

  def x_of(coordinate)
    coordinate[1..-1].to_i
  end

  def y_of(coordinate)
    ('A'..'J').to_a.index(coordinate[0]) + 1
  end

end
