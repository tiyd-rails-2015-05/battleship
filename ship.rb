class Ship
  attr_reader :length, :location

  def initialize(length)
    @length = length
    @placed = false
    @hits = []
    @location = []
  end

  def place(x, y, horizontal)
    if @placed == false
      change = 0
      @length.times do |spot|
        if horizontal
          @location << [x + change, y]
        else
          @location << [x, y + change]
        end
        change += 1
      end
      @placed = true
    end
  end

  def covers?(x, y)
    @location.include?([x, y])
  end

  def overlaps_with?(ship)
    !(@location & ship.location).empty?
  end

  def fire_at(x, y)
    if @location.include?([x, y])
      @hits += [x, y]
      @location.delete([x, y])
    end
  end

  def sunk?
    @placed == true && @location.empty?
  end
end
