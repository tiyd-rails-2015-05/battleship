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
      ship = Ship.new(i)
      puts "#{@name}, where would you like to place a ship of length #{i}?"
      coordinate = get_user_input
      puts "Across or Down?"
      orientation = get_user_input
      @ships << Ship.new(i)
    end
  end


end
