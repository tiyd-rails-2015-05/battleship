def get_user_input
  gets.chomp
end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

end

class HumanPlayer < Player

  def initialize(name="Dave")
    @name = name
  end

end

class ComputerPlayer < Player

  def initialize
    @name = "HAL 9000"
  end

end

class Ship
  attr_reader :length

  def initialize(length)
    @length = length
  end

  def place(x_val, y_val, bool)
    @locations = []
    length.times do |count|
      if bool
        @locations.push([x_val+count, y_val])
      else
        @locations.push([x_val, y_val+count])
      end
    end
  end

  def covers?(x_val, y_val)
    @locations.include?([x_val, y_val])
  end

end

my_ship = Ship.new(4)
my_ship.place(2, 1, true)
my_ship.covers?(4, 1)
