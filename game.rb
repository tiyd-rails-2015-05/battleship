require './human_player.rb'
require './computer_player.rb'

class Game

  def initialize(human_player, computer_player)
    @human_player = HumanPlayer.new()
    @computer_player = ComputerPlayer.new
  end
end
