require './ship.rb'

class Grid
  attr_reader :locations, :hits

  def initialize
    @locations = []
    @hits = []
  end

  def place_ship(ship, x, y, horizontal)
    @ship = ship
    @ship.place(x, y, horizontal)
    if (@locations & @ship.locations).empty?
      @locations += @ship.locations
    end
  end

  def has_ship_on?(x, y)
    @locations.include?([x, y])
  end

  def display
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  " + "-" * 41
    letter = ('A'..'J').to_a
    (1..10).each do |row|
      draw_row = "#{letter[row-1]} "
        (1..10).each do |column|
          if has_ship_on?(column, row)
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
    puts "  " + "-" * 41
  end

  def fire_at(x, y)
    if has_ship_on?(x, y) && !@hits.include?([x, y])
      @locations.delete([x, y])
      @hits << [x, y]
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

  def xy_of(coordinate)
    x = x_of(coordinate)
    y = y_of(coordinate)
    [x, y]
  end

end
