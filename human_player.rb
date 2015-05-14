def get_user_input
 gets.chomp
end

class HumanPlayer < Player
  attr_reader :name, :ships

  def initialize(name = "Dave")
    @name = name
    super()
    @ships = []

  end

  def place_ships(array)
    array.each do |i|
      placed = false
      until placed == true
        ship = Ship.new(i)
        puts "#{@name}, where would you like to place a ship of length #{i}?"
        coordinate = get_user_input
        puts "Across or Down?"
        orientation = get_user_input
        if orientation == "Across"
          orientation = true
        else
          orientation = false
        end
        ship.place(@grid.x_of(coordinate), @grid.y_of(coordinate), orientation)
        if ship.coverage.any? {|x| grid.has_ship_on?(x[0],x[1])}
          puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again.\n"
        else
          @grid.place_ship(ship,@grid.x_of(coordinate), @grid.y_of(coordinate), orientation)
          @ships << ship
          placed = true

        end
      end
    end
  end

  def call_shot
    puts "Dave, please enter the coordinates for your next shot (e.g. 'B10'):\n"
    shot = get_user_input
  end
end
