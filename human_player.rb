require "./player.rb"

class HumanPlayer < Player
  attr_reader :name


  def initialize(name="Dave")
    @name = name
    @mygrid = Grid.new
    @ships = [Ship.new(2), Ship.new(5)]
    # a = get_user_input
    # b = get_user_input
    # c = get_user_input
    # d = get_user_input
  end



  def grid
    @mygrid
  end

  def get_user_input
    gets.chomp
  end

  def place_ships(whatever)

    puts"Jess, where would you like to place a ship of length 2?\nAcross or Down?\n"
    # a = get_user_input
    puts"Jess, where would you like to place a ship of length 5?\nAcross or Down?\n"
    # b = get_user_input
    @mygrid.place_ship(@ships[0], 1, 1, false)
    @mygrid.place_ship(@ships[1], 4, 1, false)
  end

  def ships
    @ships
  end
end
