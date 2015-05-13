require "./ship.rb"

class Grid
  def initialize
    @board = {}
    (1..10).each {|n| @board[n] = Hash.new(false)}
    (1..10).each {|n| (1..10).each {|a| @board[n][a] = false}}
    @fires = []
    @holes = 0
    @ship = []
  end

  def has_ship_on?(column, row)
    @board[column][row]
  end

  def display
    #print @board
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
          print " "
        if @board[x+1][index+1] && @fires.include?([x+1, index+1])
          print "X"
        elsif @board[x+1][index+1]
          print "O"
        else
          print " "
        end
        print " "
        print "|"
      end
      print "\n"
    end
    print "  "
    (1..41).each{|x| print "-"}
    print "\n"
  end

  def place_ship(ship, column, row, direction)
    hasship = false
    if direction
      (column...column+ship.length).each do |a|
        if self.has_ship_on?(a, row)
          hasship = true
          return false
        end
      end
      if hasship == false
        (column...column+ship.length).each do |a|
          @board[a][row] = true
        end
      end
    else
      (row...row+ship.length).each do |a|
        if self.has_ship_on?(column, a)
          hasship = true
          return false
        end
      end
      if hasship == false
        (row...row+ship.length).each do |a|
          @board[column][a] = true
        end
      end
    end
    return true
  end

  def fire_at(column, row)
    if @fires.include?([column, row])
      false
    else
      if column>10 || row>10
        return false
      end
      @fires << [column, row]
      has_ship_on?(column, row)
    end
  end

  def sunk?
    if @fires.length != 2
      false
    else
      (0..9).each do |index|
        (0..9).each do |x|
          if @board[x+1][index+1] && @fires.include?([x+1, index+1])
            @holes += 1
          end
        end
      end
      if @holes == 2
        true
      end
    end
  end

  def x_of(input)
    input.match(/\d+/).to_s.to_i
  end

  def y_of(input)
    alpha = {"A" => 1,"B" => 2,"C" => 3,"D" => 4,"E" => 5,"F" => 6,"G" => 7,"H" => 8,"I" => 9,"J" =>10}
    alpha[input[0]]
  end

end
