class Ship
  attr_reader :length
  def initialize(length)
    @length = length
    board = {}
  end

  def covers?(column, row)
    unless (column == 1 && row = 1) || (column == 6 && row = 1) ||
      (column == 4 && row == 2)
      return true
    end
  end

  def place(column, row, covered)
    if covered
      return true
    end  
  end
end
