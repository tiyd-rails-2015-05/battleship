def get_user_input
  gets.chomp
end

class HumanPlayer < Player
attr_reader :name, :grid

  def initialize(name = "Dave")
    @name = name
    super()
  end

end
