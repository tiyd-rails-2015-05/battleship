class Hole
  def intialize(row, column)
    @row = row
    @column = column
    @pegged = false
    @hit = false
  end

  def is_hit
    @hit = true
  end

  def has_ship
    @pegged = true
  end



end
