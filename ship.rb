class Ship
  attr_accessor :length
  def initialize(length)
    @length = length
    @board = {}
    (1..10).each {|n| @board[n] = Hash.new(false)}
    @placed = false
  end
  def covers?(column, row)
     @board[column][row]
  end

  def place(column, row, direction)

    if @placed
      return false
    else
      if direction
        (2..5).each {|a| @board[a][1] = true}
      else
        (2..5).each {|a| @board[2][a] = true}
      end
    end
    @placed = true
  end

  def overlaps_with?(ship)
    (1..10).each do |a|
      (1..10).each do |b|
        if ship.covers?(a,b) && @board[a][b]
          return true
        end
      end
    end  
    return false
  end
end
