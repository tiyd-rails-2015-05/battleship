
class Grid
  #include FireAt
  attr_reader :ships

  def initialize
    @ships = []
    @hits = []
    @misses = []
    @board = {
    	A: [false, false, false, false, false, false, false, false, false, false],
    	B: [false, false, false, false, false, false, false, false, false, false],
    	C: [false, false, false, false, false, false, false, false, false, false],
    	D: [false, false, false, false, false, false, false, false, false, false],
    	E: [false, false, false, false, false, false, false, false, false, false],
    	F: [false, false, false, false, false, false, false, false, false, false],
    	G: [false, false, false, false, false, false, false, false, false, false],
    	H: [false, false, false, false, false, false, false, false, false, false],
    	I: [false, false, false, false, false, false, false, false, false, false],
    	J: [false, false, false, false, false, false, false, false, false, false]
    }
    @convert_hash = {1 => :A, 2 => :B, 3 => :C, 4 => :D, 5 => :E, 6 => :F, 7 => :G,
    								8 => :H, 9 => :I, 10 => :J}
  end

  def has_ship_on?(x_loc, y_loc)
    @ships.each do |s|
      return true if s.covers?(x_loc, y_loc)
    end
    false
  end

  def display
    if @ships.empty?
      empty_grid
    else
     ready_grid
    end
  end

  def empty_grid
  puts %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------}

  @board.each do |key, row|
  	string = ""
  	row.each do |v|
  		if v
  			string += " O |"
  		else
  			string += "   |"
  		end
  	end

  	puts key.to_s + " |" + string
  end
  puts %Q{  -----------------------------------------}
  end

  def place_ship(ship, x_loc, y_loc, orientation)
    ship.place(x_loc, y_loc, orientation)
    overlapping = false
    @ships.each do |s|
      overlapping = true if s.overlaps_with?(ship)
    end
    #something using each which sets overlapping
    if overlapping
      false
    else
      @ships << ship
      if orientation  #Across
        ship.length.times do
          row = @convert_hash[y_loc]
          @board[row][x_loc - 1] = true
          x_loc += 1
        end
      else  #Down
        ship.length.times do
          row = @convert_hash[y_loc]
          @board[row][x_loc - 1] = true
          y_loc += 1
        end
      end
      true
    end

  end

  def ready_grid
  puts %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------}
  @board.each do |key, row|
  	string = ""
  	row.each do |v|
  		if v
  			string += " O |"
  		else
  			string += "   |"
  		end
  	end
  	puts key.to_s + " |" + string
  end
  puts %Q{  -----------------------------------------}
  end

  def fire_at(x_loc, y_loc)
    if @ships.empty? || x_loc > 10 || y_loc > 10
      false
    elsif has_ship_on?(x_loc, y_loc)
      @hits << [x_loc, y_loc]
      true
    else
      @misses << [x_loc, y_loc]
      false
    end
  end



end
