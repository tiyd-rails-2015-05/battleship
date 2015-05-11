class Ship
  attr_reader :length
  def initialize(length)
    @length = length
    @board = {}
  end
  def covers?(column, row)
     @board[column][row]
  end

  def place(column, row, direction)
    (1..10).each {|n| @board[n] = Hash.new(false)}
    if direction
      (2..5).each {|a| @board[a][1] = true}
    return true
    else
      (2..5).each {|a| @board[2][a] = true}
      return true
    end

  end
end
