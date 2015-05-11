class Hole
  attr_reader :x, :y, :hit
  def initialize (x, y, hit = false)
    @x = x
    @y = y
    @hit = hit
  end

  def hit
  end
end
