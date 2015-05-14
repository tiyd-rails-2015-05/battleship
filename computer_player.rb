require './grid.rb'

class ComputerPlayer < Player

  def initialize(width: 10, height: 10)
    @width = width
    @height = height
    super(width:width, height:height)
  end

  def name
    "HAL 9000"
  end

  def place_ships(lengths_to_place)
    lengths_to_place.each do |length|
      placed = false
      until placed do
        new_ship = Ship.new(length)
        coordinate = call_shot
        horizontal = [true, false].sample
        new_ship.place(coordinate, horizontal)

        if new_ship.locations.any? {|l| @grid.has_ship_on?([l[0], l[1]])}
          placed = false
        elsif new_ship.locations.any? {|l| (l[0] > @width) || (l[1] > @height)}
          placed = false
        else
          @grid.place_ship(new_ship, coordinate, horizontal)
          placed = true
        end
      end
    end
    puts "#{self.name} has placed its ships.\n"
  end

  def call_shot
    x = (1..10).to_a.sample
    y = (1..10).to_a.sample
    @shots << [x, y]
    shot = [x, y]
  end

end
