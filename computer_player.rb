class ComputerPlayer < Player
attr_reader :name, :grid

  def initialize
    @name = "HAL 9000"
    super()
  end

end
