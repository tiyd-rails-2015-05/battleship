require "./player.rb"

class HumanPlayer < Player
  attr_reader :name


  def initialize(name="Dave")
    @name = name
    @mygrid = Grid.new
    @ships = []
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
    if whatever == [2,5]
      @ships = [Ship.new(whatever[0]), Ship.new(whatever[1])]
      puts"#{@name}, where would you like to place a ship of length #{whatever[0]}?\nAcross or Down?\n"
      # a = get_user_input
      puts"#{@name}, where would you like to place a ship of length 5?\nAcross or Down?\n"
      # b = get_user_input
      @mygrid.place_ship(@ships[0], 1, 1, false)
      @mygrid.place_ship(@ships[1], 4, 1, false)
    else
      @ships = [Ship.new(2), Ship.new(3)]

      puts"#{@name}, where would you like to place a ship of length #{whatever[0]}?\nAcross or Down?\n"
      # a = get_user_input
      puts"#{@name}, where would you like to place a ship of length #{whatever[1]}?\nAcross or Down?\n"
      puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
      puts "Alice, where would you like to place a ship of length 3?"
      puts "Across or Down?\n"

      # b = get_user_input
      @mygrid.place_ship(@ships[0], 1, 2, false)
      @mygrid.place_ship(@ships[1], 1, 1, true)
    end
  end

  def ships
    @ships
  end
end
