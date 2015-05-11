class Ship
  attr_reader :length

  def initialize(length)
    @length = length
    @place = false
  end

  def place(column, row, orientation=true)
    if @place == false
      @place = [column, row, orientation]
    end
  end

  def covers?(column, row)
    spots = []
    column_start = @place[0]
    row_start = @place[1]

    if @place[2]
      (column_start..column_start + @length-1).each do |x|
        spot = [x, row_start]
        spots << spot
      end
    else
      (row_start..row_start + @length -1).each do |x|
        spot = [column_start, x]
        spots << spot
      end
    end
    spots.include?([column, row])
  end


end



# ship = Ship.new(4)
# ship.place(2, 1)
# puts ship.covers?(2, 1)

# if @orientation
#   columns = (column..column + @length-1)
# else
#   rows = (row..row + @length-1)
# end
