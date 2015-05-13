class Grid
  #include FireAt
  attr_reader :ships

  def initialize
    @ships = []
    @hits = []
    @misses = [] #maybe make this shots and ALL shots get put in here
  end

  def has_ship_on?(x_loc, y_loc)
    @ships.each do |s|
      return s if s.covers?(x_loc, y_loc)
    end
    false
  end

  def display_header
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  -----------------------------------------"
  end

  def display_footer
    puts "  -----------------------------------------"
  end

  def display
    letters = ["A","B","C","D","E","F","G","H","I","J"]
    display_header
    (1..10).each do |row|
      output_row = "#{letters[row - 1]} |"
      (1..10).each do |column|
        if @hits.include?([column, row])
          output_row += " X |"
        elsif has_ship_on?(column, row)
          output_row += " O |"
        else
          output_row += "   |"
        end
      end
      puts output_row
    end
    display_footer
  end

  def place_ship(ship, x_loc, y_loc, orientation)
    ship.place(x_loc, y_loc, orientation)
    if @ships.any? {|s| s.overlaps_with?(ship)}

    else
      @ships << ship
      true
    end

  end

  def fire_at(x_loc, y_loc)
    ship_that_was_hit = has_ship_on?(x_loc, y_loc)
    if @ships.empty? || x_loc > 10 || y_loc > 10
      false
    elsif ship_that_was_hit
      if @hits.include?([x_loc, y_loc])
        false
      else
        @hits << [x_loc, y_loc]
        ship_that_was_hit.fire_at(x_loc, y_loc)
        true
      end
    else
      @misses << [x_loc, y_loc]
      false
    end
  end

#Add this .all? method
  def sunk?
    return false if @ships.empty?
    @ships.all? {|s| s.sunk?}

    #if @ships != [] && @hits == @ships
    #end
  end

  def x_of(guess)
    guess[1..-1].to_i
  end

  def y_of(guess)
    convert_hash = {1 => :A, 2 => :B, 3 => :C, 4 => :D, 5 => :E, 6 => :F,
                    7 => :G, 8 => :H, 9 => :I, 10 => :J}.invert
    guess = convert_hash[guess[0].to_sym]
  end


end
