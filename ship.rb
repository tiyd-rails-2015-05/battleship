class Ship

  attr_accessor :length, :positions, :placed, :holes

  def initialize(length)
    @length = length
    @positions = []
    @placed = false
    @holes = []
  end

  def covers?(column, row)
    @positions.include?([column, row])
  end

  def place(column, row, direction)
    if @placed
      return false
    else
      direction ? (column...column+@length).each{|a| @positions << [a, row]} :
      (row...row+@length).each{|a| @positions << [column, a]}
      # LONGHAND NOTATION
      # if direction
      #   (column...column+@length).each do |a|
      #     @positions << [a, row]
      #   end
      # else
      #   (row...row+@length).each do |a|
      #     @positions << [column, a]
      #   end
      # end
    end
    @placed = true

  end

  def overlaps_with?(ship)
    ship.positions.each do |array|
      ship.covers?(array[0], array[1]) && @positions.include?(array) ?
      (return true) : ()
    end
    false
  end

  def fire_at(column, row)
    self.covers?(column, row) ?
    (@holes << [column, row] unless @holes.include?([column, row]); true) : (false)
    # if self.covers?(column, row)
    #   unless @holes.include?([column, row])
    #     @holes << [column, row]
    #   end
    #   true
    # else
    #   false
    # end
  end

  def sunk?
    @holes.length == @length ? true : false
  end

end
