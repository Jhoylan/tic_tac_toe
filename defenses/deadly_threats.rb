class BasicDefense 
  def self.avoid_deadly_threat game
    return true if avoid_horizontal_deadly_threat game
    return true if avoid_vertical_deadly_threat game
    return true if avoid_diagonal_deadly_threat game
  end

  private 
  def self.avoid_horizontal_deadly_threat game
    for row in game do
      if (row.count 1) == 2 && (row.count 0) == 0
        row.map! { |element| element == "*" ? 0 : 1 }
        return true
      end
    end

    return false
  end

  def self.avoid_vertical_deadly_threat game
    column = 0

    while column < 3 do
      column_elements = [game[0][column], game[1][column], game[2][column]]
      if (column_elements.count 1) == 2 && (column_elements.count 0) == 0
        game[0][column] = 0 if game[0][column] == "*"
        game[1][column] = 0 if game[1][column] == "*"
        game[2][column] = 0 if game[2][column] == "*"

        return true
      end

      column += 1
    end

    return false
  end

  def self.avoid_diagonal_deadly_threat game
    return true if main_daiagonal_deadly_threat game
    return true if secundary_daiagonal_deadly_threat game
  end

  def self.main_daiagonal_deadly_threat game
    main_daiagonal = [game[0][0], game[1][1], game[2][2]]  
    
    if (main_daiagonal.count 1) == 2 && (main_daiagonal.count 0) == 0
      game[0][0] = 0 if main_daiagonal[0] == "*"
      game[1][1] = 0 if main_daiagonal[1] == "*"
      game[2][2] = 0 if main_daiagonal[2] == "*"
      
      return true
    end  
    
    return false
  end

  def self.secundary_daiagonal_deadly_threat game
    secundary_daiagonal = [game[2][0], game[1][1], game[0][2]]  
    
    if (secundary_daiagonal.count 1) == 2 && (secundary_daiagonal.count 0) == 0
      game[2][0] = 0 if secundary_daiagonal[0] == "*"
      game[1][1] = 0 if secundary_daiagonal[1] == "*"
      game[0][2] = 0 if secundary_daiagonal[2] == "*"
      
      return true
    end    

    return false
  end
end