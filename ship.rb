class Ship
  attr_reader :length, :place, :ship_locations

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
    !(@ship_locations & other_ship.ship_locations == [])
  end

end
