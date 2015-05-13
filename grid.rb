require './ship.rb'

class Grid
  attr_reader :hits, :ships

  def initialize
    @ships = []
    @hits = []
  end

  def place_ship(ship, coordinate, horizontal)
    ship.place(coordinate, horizontal)
    if @ships.all? { |already_placed| (already_placed.locations & ship.locations).empty? }
      @ships << ship
    end
  end

  def has_ship_on?(coordinate)
    @ships.any? {|ship| ship.locations.include?(coordinate)}
  end

  def display
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  " + "-" * 41
    letter = ('A'..'J').to_a
    (1..10).each do |row|
      draw_row = "#{letter[row-1]} "
        (1..10).each do |column|
          if has_ship_on?([column, row])
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

  def x_of(coordinate)
    coordinate[1..-1].to_i
  end

  def y_of(coordinate)
    ('A'..'J').to_a.index(coordinate[0]) + 1
  end

  def xy_of(coordinate)
    [x_of(coordinate), y_of(coordinate)]
  end

  def fire_at(coordinate)
    if has_ship_on?(coordinate) && !@hits.include?(coordinate)
      @ships.each do |ship|
        ship.fire_at(coordinate)
        @ships.delete(ship) if ship.sunk?
      end
      @hits << coordinate
    end
  end

  def sunk?
    @ships.empty? && !@hits.empty?
  end
end
