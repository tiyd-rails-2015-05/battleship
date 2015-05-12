class Game

  def initialize(first_player, second_player)
    @first_player = first_player
    @second_player = second_player
  end

  def welcome
    puts "Welcome, #{@first_player.name} and #{@second_player.name}!\nIt's time to play Battleship.\n"
  end

  def place_ships
    @first_player.place_ships
    @second_player.place_ships
  end

  def display_status
    @first_player.grid.display
  end
end
