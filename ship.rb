class Ship

  attr_accessor :length

  def initialize(length)
    @length = length
    @board = {}
    (1..10).each do |row|
      @board[row] = Hash.new(1..10)
      (1..10).each do |column|
        @board[row][column] = false
      end
    end
    @placed = false
  end

  def covers?(column, row)
    @board[row][column]
  end

  def place(column, row, direction)
    if @placed

      return false

    else

      if direction

        (column...column+@length).each do |a|
          @board[row][a] = true
        end

      else

        (row...row+@length).each do |a|
          @board[a][column] = true
        end

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
