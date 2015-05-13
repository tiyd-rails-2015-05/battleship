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
  #  puts "HAL 9000 has placed its ships.\n"

=begin
    positions = []
    directions = []
    (2..3).each do |length|
      puts "#{@player.name}, where would you like to place a ship of length #{length}?"
      positions << get_user_input
      puts"Across or Down?"
      directions << get_user_input
    end
    (3..5).each do |length|
      puts "#{@player.name}, where would you like to place a ship of length #{length}?"
      positions << get_user_input
      puts"Across or Down?"
      directions << get_user_input
    end
    puts "HAL 9000 has placed its ships.\n"
=end
  end

end
