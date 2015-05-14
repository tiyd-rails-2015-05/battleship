class ComputerPlayer < Player
  attr_reader :name, :ships

  def initialize
    @name = "HAL 9000"
    super()
    @ships = []
  end

  def place_ships(array)
    array.each do |i|
      placed = false
      until placed == true
        ship = Ship.new(i)
        orientation = [true,false].sample
        if orientation == "Across"
          orientation = true
          x = (1..10-i).to_a.sample
          y = i
        else
          orientation = false
          x = i
          y = (1..10-i).to_a.sample
        end
        ship.place(x, y, orientation)
        if ship.coverage.any? {|x| grid.has_ship_on?(x[0],x[1])}
        else
          @grid.place_ship(ship,x,y, orientation)
          @ships << ship
          placed = true
        end
      end
    end
    puts "HAL 9000 has placed its ships.\n"
  end

  def call_shot
    computer_shot = ("A".."J").to_a.sample + (1..10).to_a.sample.to_s
  end
end
