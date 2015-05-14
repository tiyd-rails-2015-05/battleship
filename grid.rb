require './ship.rb'

class Grid
  attr_reader :hits, :ships

  def initialize(width: 10, height: 10)
    @width = width
    @height = height
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
    first_line = ""
    @width.times { |time| first_line += ("   " + "#{time+1}") }
    puts " " + first_line
    puts "  " + ("----") * @width + "-"
    letter = ('A'..'Z').to_a
    (1..@height).each do |row|
      draw_row = "#{letter[row-1]} "
        (1..@width).each do |column|
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
    puts "  " + ("----") * @width + "-"
  end

  def x_of(coordinate)
    coordinate[1..-1].to_i
  end

  def y_of(coordinate)
    ('A'..'Z').to_a.index(coordinate[0]) + 1
  end

  def xy_of(coordinate)
    [x_of(coordinate), y_of(coordinate)]
  end

  def fire_at(coordinate)
    if has_ship_on?(coordinate) && !@hits.include?(coordinate)
      @ships.each do |ship|
        ship.fire_at(coordinate)
        if ship.sunk?
          @ships.delete(ship)
          puts "You have successfully sunk a ship!"
        end
      end
      @hits << coordinate
    end
  end

  def sunk?
    @ships.empty? && !@hits.empty?
  end
end
