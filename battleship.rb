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

class Holes
  attr_reader :x, :y

  def initialize(args)
    @x = args[0]
    @y = args[1]
  end

  def hit
    @hit = true
  end

  def hit?
    if @hit == true
      true
    else
      false
    end
  end

end

class Ship
  attr_reader :length, :locations

  def initialize(length)
    @length = length
  end

  def place(x_val, y_val, bool)
    if @locations.nil?
      @locations = []
      length.times do |count|
        if bool
          @locations.push(Holes.new([x_val+count, y_val]))
        else
          @locations.push(Holes.new([x_val, y_val+count]))
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
    @locations.each do |holes_object|
      x = holes_object.x
      y = holes_object.y
      if ship_object.covers?(x, y)
        return true
      end
    end
    false
  end

  def fire_at(x, y)
    covers?(x, y)
  end

  def sunk?
    if @locations.nil?
      return false
    else
      bool_arr = []
      @locations.each do |item|
        bool_arr.push(item.hit?)
      end
      if bool_arr.include?(false)
        false
      else
        true
      end
    end
  end

end

class Grid
  attr_reader :display

  def display
  puts  "    1   2   3   4   5   6   7   8   9   10"
  puts "  -----------------------------------------"
  puts "A |   |   |   |   |   |   |   |   |   |   |"
  puts "B |   |   |   |   |   |   |   |   |   |   |"
  puts "C |   |   |   |   |   |   |   |   |   |   |"
  puts "D |   |   |   |   |   |   |   |   |   |   |"
  puts "E |   |   |   |   |   |   |   |   |   |   |"
  puts "F |   |   |   |   |   |   |   |   |   |   |"
  puts "G |   |   |   |   |   |   |   |   |   |   |"
  puts "H |   |   |   |   |   |   |   |   |   |   |"
  puts "I |   |   |   |   |   |   |   |   |   |   |"
  puts "J |   |   |   |   |   |   |   |   |   |   |"
  puts "  -----------------------------------------"
  end

  def place_ship(ship_object, x, y, bool)
    @ship = ship_object
    @ship.place(x, y, bool)
  end

  def has_ship_on?(x, y)
    if @ship.nil?
      return false
    else
      @ship.covers?(x, y)
    end
  end

end
