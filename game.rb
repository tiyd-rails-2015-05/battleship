class Game

  def initialize(first_player, second_player)
    @first_player = first_player
    @second_player = second_player
  end

  def welcome
    puts "Welcome, #{@first_player.name} and #{@second_player.name}!\nIt's time to play Battleship.\n"
  end

  def place_ships
    @first_player.place_ships([2, 3, 3, 4, 5])
    @second_player.place_ships([2, 3, 3, 4, 5])
  end

  def display_status
    puts "SHOTS TAKEN:"
    @first_player.display_shots_grid
    puts
    puts "YOUR BOARD:"
    @first_player.grid.display
  end
end
