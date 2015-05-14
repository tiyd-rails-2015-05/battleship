class HumanPlayer < Player
attr_reader :name, :grid

  def initialize(name = "Dave")
    @name = name
    super()
  end

end
