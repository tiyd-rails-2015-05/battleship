require './grid.rb'
require './player.rb'
require './ship.rb'

def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  attr_reader :name
  def initialize(name: "Dave", width: 10, height: 10)
    super(width:width, height:height)
    @name = name
    @height = height
    @width = width
  end

  def place_ships(lengths_to_place)
    lengths_to_place.each do |length|
      placed = false
      until placed do
        new_ship = Ship.new(length)
        puts "#{@name}, where would you like to place a ship of length #{length}?"
        coordinate = @grid.xy_of(get_user_input)
        puts "Across or Down?"
        orientation = get_user_input
        horizontal = (orientation == "Across")
        new_ship.place(coordinate, horizontal)
        if new_ship.locations.any? {|l| @grid.has_ship_on?([l[0], l[1]])}
          puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
        else
          @grid.place_ship(new_ship, coordinate, horizontal)
          placed = true
        end
      end
    end
  end

  def call_shot
    puts "#{@name}, please enter the coordinates for your next shot (e.g. 'B10'):"
    shot = @grid.xy_of(get_user_input)
    if @shots.include?(shot)
      puts "You already made that shot before."
    end
    @shots << shot
    shot
  end

  def display_shots_grid
    first_line = ""
    @width.times { |time| first_line += ("   " + "#{time+1}") }
    puts " " + first_line
    puts "  " + ("----") * @width + "-"
    letter = ('A'..'Z').to_a
    (1..@height).each do |row|
      draw_row = "#{letter[row-1]} "
        (1..@width).each do |column|
          if @hits.include?([column, row])
            draw_row += "| + "
          elsif @misses.include?([column, row])
            draw_row += "| - "
          else
            draw_row += "|   "
          end
        end
        draw_row += "|"
        puts draw_row
    end
    puts "  " + ("----") * @width + "-"
  end
end
