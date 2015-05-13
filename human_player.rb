require "./player.rb"

def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  attr_reader :name, :ships, :grid

  def initialize(name="Dave")
    @name = name
    @grid = Grid.new
    @ships = []
  end

  def ships
    @ships
  end

  def grid
    @grid
  end

  def place_ships(arsenal)
    arsenal.each do |a|
      loopit = true
      while loopit == true
        puts "#{@name}, where would you like to place a ship of length #{a}?"
        cordinates = get_user_input
        puts  "Across or Down?"
        direction = get_user_input
        if direction =="Down"
          direction = false
        elsif direction == "Across"
          direction == true
        end
        column = grid.x_of(cordinates)
        row = grid.y_of(cordinates)
        placeholder = Ship.new(a)
        placing = @grid.place_ship(placeholder, column, row, direction)
        #@grid.display
        if placing != true
          puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again.\n"
        else
          loopit = false
          @ships << placeholder
        end
      end
    end
  end

  def call_shot
    puts "#{@name}, please enter the coordinates for your next shot (e.g. 'B10'):"
    coordinates = get_user_input.split('', 2)

  end

end


=begin
    if  == [2,5]
      @ships = [Ship.new(arsenal[0]), Ship.new(whatever[1])]
      puts"#{@name}, where would you like to place a ship of length #{whatever[0]}?\nAcross or Down?\n"
      # a = get_user_input
      puts"#{@name}, where would you like to place a ship of length 5?\nAcross or Down?\n"
      # b = get_user_input
      @grid.place_ship(@ships[0], 1, 1, false)
      @grid.place_ship(@ships[1], 4, 1, false)
    else
      @ships = [Ship.new(2), Ship.new(3)]

      puts"#{@name}, where would you like to place a ship of length #{whatever[0]}?\nAcross or Down?\n"
      # a = get_user_input
      puts"#{@name}, where would you like to place a ship of length #{whatever[1]}?\nAcross or Down?\n"
      puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
      puts "Alice, where would you like to place a ship of length 3?"
      puts "Across or Down?\n"

      # b = get_user_input
      @grid.place_ship(@ships[0], 2, 1, false)
      @grid.place_ship(@ships[1], 1, 6, true)
    end
=end
