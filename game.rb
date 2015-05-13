require './human_player.rb'
require './computer_player.rb'
require './grid.rb'

class Game

  def initialize(player_1, player_2 = ComputerPlayer.new)
    @player_1 = player_1
    @player_2 = player_2
  end

  def welcome
    puts "Welcome, #{@player_1.name} and #{@player_2.name}!\nIt's time to play Battleship.\n"
  end

  def place_ships
      @player_1.place_ships([2, 3, 3, 4, 5])
      @player_2.place_ships([2, 3, 3, 4, 5])
  end

  def display_status
    puts "SHOTS TAKEN:
    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   |   |   |   |   |   |   |   |   |   |
B |   |   |   |   |   |   |   |   |   |   |
C |   |   |   |   |   |   |   |   |   |   |
D |   |   |   |   |   |   |   |   |   |   |
E |   |   |   |   |   |   |   |   |   |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------

YOUR BOARD:"
    print @player_1.grid.display
  end
end
