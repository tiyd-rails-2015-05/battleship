class Ship
  attr_reader :length

  def initialize(length)
    @length = length
    @place = false
    @ship_locations = []
  end

  def place(column, row, orientation=true)
    if @place == false
      @place = [column, row, orientation]
      column_start = @place[0]
      row_start = @place[1]
      if orientation == true
        (column_start..column_start + @length-1).each do |x|
          location = [x, row_start]
          @ship_locations << location
        end
      else
        (row_start..row_start + @length -1).each do |x|
          location = [column_start, x]
          @ship_locations << location
        end
      end
    end
  end


  def covers?(column, row)
    @ship_locations.include?([column, row])
  end

  def overlaps_with?(other_ship)
  end


end



# ship = Ship.new(4)
# ship.place(2, 1)
#p ship.ship_locations
# p @ship_locations

# if @orientation
#   columns = (column..column + @length-1)
# else
#   rows = (row..row + @length-1)
# end
# def ship_locations
#
#
#   if @place
#     (column_start..column_start + @length-1).each do |x|
#       location = [x, row_start]
#       @ship_locations << location
#     end
#   else
#     (row_start..row_start + @length -1).each do |x|
#       location = [column_start, x]
#       @ship_locations << location
#     end
#   end
#   # @ship_locations
# end
