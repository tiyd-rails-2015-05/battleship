class ComputerPlayer < Player
  attr_reader :name, :ships

  def initialize
    @name = "HAL 9000"
    super()
    @ships = []
  end

  def place_ships(locs)
    puts "HAL 9000 has placed its ships.\n"
    locs.each do |i|
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
          puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again.\n"
        else
          @grid.place_ship(ship,x,y, orientation)
          @ships << ship
          placed = true
        end
      end
    end
  end

  # def computer_shot
  #   ("A".."J").to_a
  # end
end
