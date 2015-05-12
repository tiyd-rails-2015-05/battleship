class Hole
  attr_reader :x, :y, :hit
  def initialize (x, y, hit = false)
    @x = x
    @y = y
    @hit = hit
  end

  
  class Holes
   attr_reader :x, :y

   def initialize(args)
     @x = args[0]
     @y = args[1]
   end

   def hit
     @hit = true
   end

   def hit?
     if @hit == true
       true
     else
       false
     end
   end

  end
  # def hit
  # end
end
