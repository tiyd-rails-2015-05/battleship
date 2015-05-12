class Hole
  attr_reader :spot, :hit
  def initialize(x,y)
    @spot = [x,y]
    @hit = false
  end
end
