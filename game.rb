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

  def place_ships(a, b, c, d, e)
    @first_player.place_ships([a, b, c, d, e])
    @second_player.place_ships([a, b, c, d, e])
  end

  def display_status
    puts "SHOTS TAKEN:"
    @offense.display_shots_grid
    puts
    puts "YOUR BOARD:"
    @offense.grid.display
  end

  def switch_player
    @offense == @first_player? @offense = @second_player : @offense = @first_player
    @defense == @first_player? @defense = @second_player : @defense = @first_player
  end

  def take_turn
    shot = @offense.call_shot

    if @defense.grid.fire_at(shot)
      puts "Hit!\n\n\n"
      puts "-" * 50
      @offense.hits << shot

    else
      puts "Miss!\n\n\n"
      puts "-" * 50
      @offense.misses << shot
    end
    switch_player
  end

  def play
    winner = nil
    welcome
    place_ships(2, 3, 3, 4, 5)
    until winner
      display_status
      take_turn
      if @first_player.grid.sunk?
        winner = @second_player.name
      elsif @second_player.grid.sunk?
        winner = @first_player.name
      end
    end
    puts "Congratulations, #{winner}!"
  end

end
