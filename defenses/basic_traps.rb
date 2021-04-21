class MediumDefense
  def self.avoid_basic_traps game
    return true if avoid_lateral_traps game    
    return true if avoid_central_traps game
    return false
  end
  
  def self.avoid_lateral_traps game
    if game[1][1] == "*"
      game[1][1] = 0 
      return true
    end

    return false
  end

  def self.avoid_central_traps game
    if game[1][1] == 1
      row = rand(2) * 2
      column = rand(2) * 2
      game[row][column] = 0 if game[row][column] == "*"
      return true
    end

    return false
  end
end