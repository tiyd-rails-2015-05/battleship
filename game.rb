class Game

  def initialize(first_player, second_player)
    @first_player = first_player
    @second_player = second_player
    @offense = @first_player
    @defense = @second_player
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

  def take_turn

    shot = @offense.call_shot

    if @defense.grid.has_ship_on?(@defense.grid.x_of(shot), @defense.grid.y_of(shot))
      puts "Hit!"
      @defense.grid.locations.delete([@defense.grid.x_of(shot), @defense.grid.y_of(shot)])
      @offense.hits << [@defense.grid.x_of(shot), @defense.grid.y_of(shot)]
      @defense.grid.hits << [@defense.grid.x_of(shot), @defense.grid.y_of(shot)]
    else
      puts "Miss!"
      @offense.misses << [@defense.grid.x_of(shot), @defense.grid.y_of(shot)]
    end

    @offense == @first_player? @offense = @second_player : @offense = @first_player
    @defense == @first_player? @defense = @second_player : @defense = @first_player
  end

  def play
    winner = nil
    until winner
      take_turn
      if @first_player.grid.locations.empty?
        winner = @first_player.name
      elsif @second_player.grid.locations.empty?
        winner = @second_player.name
      end
    end
    final = puts "Congratulations, #{winner}!"


  end

end
