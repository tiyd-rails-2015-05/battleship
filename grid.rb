class Grid
  attr_reader :board
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
    @board[row][column]
  end

  def display
#     puts(
# "    1   2   3   4   5   6   7   8   9   10
#   -----------------------------------------
# A |   |   |   |   |   |   |   |   |   |   |
# B |   |   |   |   |   |   |   |   |   |   |
# C |   |   |   |   |   |   |   |   |   |   |
# D |   |   |   |   |   |   |   |   |   |   |
# E |   |   |   |   |   |   |   |   |   |   |
# F |   |   |   |   |   |   |   |   |   |   |
# G |   |   |   |   |   |   |   |   |   |   |
# H |   |   |   |   |   |   |   |   |   |   |
# I |   |   |   |   |   |   |   |   |   |   |
# J |   |   |   |   |   |   |   |   |   |   |
#   -----------------------------------------"
# )

    print " "
    (1..10).each do |x|
      print "   #{x}"
    end
    print "\n"
    print "  "
    (1..41).each{|x| print "-"}
    print "\n"

    alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    (0..9).each do |index|
      print "#{alpha[index]} |"
      (0..9).each do |x|
        print "   |"
      end
      print "\n"
    end
    print "  "
    (1..41).each{|x| print "-"}
    print "\n"
  end

  private def ship_overlap?
    if direction
      (column...column+ship.length).each do |a|
        if @board[row][column] == ship.covers?(column, row)
          false
        end
      end
    else
      (row...row+ship.length).each do |b|
        if @board[row][column] == ship.covers?(column, row)
          false
        end
      end
    end
  end

  def place_ship(ship, column, row, direction)
    if direction
      (column...(column+ship.length)).each do |a|
        # puts "ship.covers?(a, row): #{ship.covers?(a, row)}"        #for debugging purposes
        if @board[row][a]
          return false
        end
      end
      (column...column+ship.length).each do |b|
        @board[row][b] = true
      end
      return true
    else
      (row...row+ship.length).each do |c|
        if @board[c][column]
          return false
        end
      end
      (row...row+ship.length).each do |d|
        @board[d][column] = true
      end
      return true
    end

    # if @board[row][column] == ship.covers?(column, row)
    #
    #   if direction
    #
    #     (column...column+ship.length).each do |a|
    #       @board[row][a] = true
    #     end
    #
    #   else
    #
    #     (row...row+ship.length).each do |a|
    #       @board[a][column] = true
    #     end
    #
    #   end
    #
    # else
    #   false
    # end




  end

end
