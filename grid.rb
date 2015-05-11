class Grid
  def initialize
    @board = {}
    (1..10).each do |row|
      @board[row] = Hash.new(1..10)
      (1..10).each do |column|
        @board[row][column] = false
      end
    end

  end

  def has_ship_on?(column, row)


    false



  end

  def display
    puts "    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   |   |   |   |   |   |   |   |   |   |
B |   |   |   |   |   |   |   |   |   |   |
C |   |   |   |   |   |   |   |   |   |   |
D |   |   |   |   |   |   |   |   |   |   |
E |   |   |   |   |   |   |   |   |   |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------"
  end

  def place_ship(ship, column, row, direction)

    if direction

      (column...column+ship.length).each do |a|
        @board[row][a] = true
      end

    else

      (row...row+ship.length).each do |a|
        @board[a][column] = true
      end

    end
  end

  def has_ship_on?(column, row)
    @board[row][column]
  end

end
