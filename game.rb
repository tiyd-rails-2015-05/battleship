require './human_player.rb'
require './computer_player.rb'
require './grid.rb'

class Game

  def initialize(player_1, player_2 = ComputerPlayer.new)
    @player_1 = player_1
    @player_2 = player_2
    @offense = player_1
    @defense = player_2
  end

  def welcome
    puts "Welcome, #{@player_1.name} and #{@player_2.name}!\nIt's time to play Battleship.\n"
  end

  def place_ships
      @player_1.place_ships([2, 3, 3, 4, 5])
      @player_2.place_ships([2, 3, 3, 4, 5])
  end

  def display_status
    board = {}
    (1..10).each do |row|
      board[row] = Array.new
        (0..9).each do |column|
        board[row][column] = false
      end
    end

    @offense.hits.each do |array|
      board[array[1]][array[0]-1] = "hit"
    end

    @offense.misses.each do |array|
      board[array[1]][array[0]-1] = "miss"
    end

    puts "SHOTS TAKEN:"
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  " + "-" * 41
    letters = ("A".."J").to_a
    board.each do |key, row|
      letter = "#{letters[key-1]} "
      row.each do |v|
        if v == "hit"
          letter += "| + "
        elsif v == "miss"
          letter += "| - "
        else
          letter += "|   "
        end
      end
      puts letter + "|"
    end
    puts "  " + "-" * 41
    puts
    puts "YOUR BOARD:"
    print @player_1.grid.display
  end

  def take_turn
    guess = @offense.call_shot
    x_val = @player_1.grid.x_of(guess)
    y_val = @player_1.grid.y_of(guess)

    if @defense.grid.fire_at(x_val, y_val)
      @offense.hits<<[x_val, y_val]
      print "Hit!"
    else
      @offense.misses<<[x_val, y_val]
      print "Miss!"
    end
    switch_turn
  end

  def switch_turn
    @offense == @player_1? @offense = @player_2 : @offense = @player_1
    @defense == @player_1? @defense = @player_2 : @defense = @player_1
  end

  def play
    welcome
    place_ships

    until @player_1.grid.sunk? || @player_2.grid.sunk?
      display_status
      take_turn
    end
    if @player_2.grid.sunk?
      puts "Congratulations, #{@player_1.name}! You won!"
    elsif @player_1.grid.sunk?
      puts "Congratulations, #{@player_2.name}! You won!"
    end
  end

end
