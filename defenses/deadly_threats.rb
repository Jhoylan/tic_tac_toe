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
    main_daiagonal = [game[0][0], game[1][1], game[2][2]]
    secundary_daiagonal = [game[2][0], game[1][1], game[0][2]]
    diagonals = [main_daiagonal, secundary_daiagonal]

    diagonals.each do |diagonal|
      if (diagonal.count 1) == 2 && (diagonal.count 0) == 0
        game[0][0] = 0 if diagonal[0] == "*"
        game[1][1] = 0 if diagonal[1] == "*"
        game[2][2] = 0 if diagonal[2] == "*"
        
        return true
      end
    end   

    return false
  end
end