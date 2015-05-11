class Player
  attr_reader :name
  def initialize (name)
    @name = name
  end

  def get_user_input
    gets.chomp
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

class Ship
  attr_reader :length
  def initialize (length)
    @length = length
  end

  def place (x_val, y_val, bool)
    @bool = bool
    @x_val = x_val
    @y_val = y_val
    if @bool == true
      @across_array =[@x_val..(@length + @x_val-1)]
    else
      @down_array = [@y_val..(@length + @y_val-1)]
    # bool == false
    # then down
    # [down_num..(@length + down_num)]

  end

  def covers?(num1, num2)
    @num1 = num1
    @num2 = num2
    # [@across_num..(@length + @across_num)]
    if @bool == true && @down_array.include?(num2) == true
      p "true"
    elsif @bool == false && @across_array.include"@across_array.include?(num2) == true

  end


end
