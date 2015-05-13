require './human_player.rb'
require './computer_player.rb'

class Game

  def initialize(human_player, computer_player)
    @human_player = human_player
    @computer_player = computer_player
  end

  def welcome
    puts "Welcome, #{@human_player.name} and HAL 9000!\nIt's time to play Battleship.\n"
  end
end
