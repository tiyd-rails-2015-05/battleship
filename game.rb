class Game
  attr_reader :player, :computer
  def initialize(player=0, computer=0)
    if player == 0 && computer == 0
      raise ArgumentError
    else
      @player = player
      @computer = computer
    end
  end

  def welcome
    puts "Welcome, #{@player.name} and #{@computer.name}!"
    puts "It's time to play Battleship."
  end

  def place_ships
    arsenal = [2,3,3,4,5]
    @player.place_ships(arsenal)
    @computer.place_ships(arsenal)
  end

  def display_status
    puts "SHOTS TAKEN:"
    @player.shots.display
    puts
    puts "YOUR BOARD:"
    @player.grid.display

  end

end
