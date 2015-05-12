

class Ship
  attr_reader :length, :holes
  def initialize(length)
    @length = length
    @holes = []
  end

  def place(x, y, horz)
    if @holes == []
      if horz == true
        (x..(x + @length - 1)).each do |i|
          @holes << Hole.new(i, y)
        end
      else
        (y..(y + @length - 1)).each do |i|
          @holes << Hole.new(x, i)
        end
      end
    end
  end

  def covers?(x, y)
    @holes.any? {|hole| hole.spot == [x,y]}
  end

  def overlaps_with?(check_ship)
    @holes.each do |i|
      if check_ship.covers?(i.spot[0],i.spot[1]) == true
        return true
        exit loop
      end
    end
    return false
  end

  def fire_at(x, y)
    if covers?(x,y)
      @holes.each do |hole|
        if hole.spot == [x,y]
          hole.hit_it
        end
      end
    end
  end

  def sunk?
    if @holes == []
      return false
    else
      @holes.each do |hole|
        if hole.hit == false
          return false
        end
      end
    end
  end


end
