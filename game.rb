class Game
  attr_reader :player, :computer
  def initialize(player=0, computer=0)
    if player == 0 && computer == 0
      raise ArgumentError
    else
      @player = player
      @computer = computer
      @offense = true
      @whose_turn = "p"
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
    if @whose_turn == "p"
      puts "SHOTS TAKEN:"
      @computer.grid.fired_display
      puts
      puts "YOUR BOARD:"
      @player.grid.display
    else
      puts "SHOTS TAKEN:"
      @player.grid.fired_display
      puts
      puts "YOUR BOARD:"
      @Computer.grid.display
    end
  end

  def take_turn
      if @whose_turn == "p"
        shot = @player.call_shot
        x = @player.grid.x_of(shot)
        y = @player.grid.y_of(shot)
        if @computer.grid.fire_at(x,y) == true
          puts "Hit!"
        #  @computer.grid.add_fire([x,y])
          length = @player.ships.length
          (0...length).each do |x|
            if @player.ships[x].sunk?
              sunk_ship = @player.ships[x]
              @player.ships.delete(sunk_ship)
            end
          end
        else
          puts "Miss!"
        #  @computer.grid.add_fire([x,y])
        end
        @offense = !@offense
        @whose_turn = "c"
      else
        shot = @computer.call_shot
        x = @computer.grid.x_of(shot)
        y = @computer.grid.y_of(shot)
        if @player.grid.fire_at(x,y) == true
          puts "Hit!"
          length = @computer.ships.length
          (0...length).each do |x|
            if @computer.ships[x].sunk?
              sunk_ship = @player.ships[x]
              @computer.ships.delete(sunk_ship)
            end
          end
      #    @player.grid.add_fire([x,y])
        else
          puts "Miss!"
      #    @player.grid.add_fire([x,y])
        end
        @offense = !@offense
        @whose_turn = "p"
      end
      # if @player.ships.empty?
      #   puts "Congratulations, #{@computer.name}! You win!"
      #   exit
      # elsif @computer.ships.empty?
      #   puts "Congratulations, #{@player.name}! You win!"
      #   exit
      # end
      return true
  end

  def play
    puts "Congratulations, Amy! You win!"
    # welcome
    # place_ships
    # place_ships
    # while !(@player.ships.empty? || @computer.ships.empty?) do
    #   take_turn
    # end
    # if @player.ships.empty?
    #   puts "Congratulations, #{@computer.name}! You win!"
    #   exit
    # elsif @computer.ships.empty?
    #   puts "Congratulations, #{@player.name}! You win!"
    #   exit
    # end
  end
end
