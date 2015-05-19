class Hole

  attr_reader :coordinate, :hit

  def initialize(x, y, hit = false)
    @coordinate = [x, y]
    @hit = hit
  end

  def hit?(x, y)
    if @coordinate == [x, y]
      @hit = true
    end
  end

end
