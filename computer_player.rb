require './grid.rb'

class ComputerPlayer < Player
  attr_accessor :ships

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
        new_ship.place(@grid.x_of(coordinate), @grid.y_of(coordinate), horizontal)

        if new_ship.locations.any? {|l| @grid.has_ship_on?(l[0], l[1])}
          placed = false
        else
          @grid.place_ship(new_ship, @grid.x_of(coordinate), @grid.y_of(coordinate), horizontal)
          @ships << new_ship
          placed = true
        end
      end
    end
    puts "#{self.name} has placed its ships.\n"
  end

  def call_shot
    x = (1..10).to_a.sample
    y = ('A'..'J').to_a.sample
    "#{y}#{x}"
  end

end
