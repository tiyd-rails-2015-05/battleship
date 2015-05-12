require "./hole.rb"

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
  attr_reader :length, :locations
  def initialize(length)
    @length = length
  end

  def place(x, y, bool)
    if @locations.nil?
      @locations = []
      length.times do |count|
        if bool
          @locations.push(Hole.new(x+count, y))
        else
          @locations.push(Hole.new(x, y+count))
        end
      end
    end
  end

  def covers?(x_val, y_val)
    @locations.each do |holes_object|
      if holes_object.x == x_val && holes_object.y == y_val
       holes_object.hit
       return true
      end
    end
   false
 end

  def overlaps_with?(ship_object)
    @locations.each do |item|
      if ship_object.covers?(item.x, item.y)
        return true
      end
    end
    false
  end
  #
  # def fire_at(x, y)
  #   if Ship.covers?(x, y)
  #     Locations.hit(x, y)
  #     return true
  #   end
  # end
  #
  # def ship_sunk?
  #
  # end

end

ship1 = Ship.new(4)
ship1.place(2, 1, true)
ship2 = Ship.new(4)
ship2.place(3, 1, true)
ship3 = Ship.new(4)
ship3.place(2, 1, false)

p ship1.overlaps_with?(ship2)
p ship1.overlaps_with?(ship3)
p ship2.overlaps_with?(ship3)
