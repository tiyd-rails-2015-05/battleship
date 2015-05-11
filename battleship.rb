def get_user_input
  gets.chomp
end

class Player
  attr_reader :name
  def initialize (name)
    @name = name
  end
end

class HumanPlayer < Player
  def initialize (name = "Dave")
    @name = name
  end
end

class ComputerPlayer < Player
  def initialize
    @name = "HAL 9000"
  end
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
    if @locations.nil?
      @locations = []
      length.times do |count|
        if bool
          @locations.push([x_val+count, y_val])
        else
          @locations.push([x_val, y_val+count])
        end
      end
    end
  end

  def location
    @locations
  end

  def covers?(x_val, y_val)
    @locations.include?([x_val, y_val])
  end

  def overlaps_with?(ship_object)
    @locations.each do |item|
      x = item[0]
      y = item[1]
      if ship_object.covers?(x, y)
        return true
      end
    end
    false
  end

  def fire_at(x,y)
    if @locations.include?([x, y])
      return true
    end
  end

  def ship_sunk?

  end

end

ship1 = Ship.new(4)
ship1.place(2, 1, true)
ship2 = Ship.new(4)
ship2.place(3, 1, true)
ship3 = Ship.new(4)
ship3.place(2, 1, false)

p ship1.overlaps_with?(ship2)
# ship1.overlaps_with?(ship3)
# ship2.overlaps_with?(ship3)
