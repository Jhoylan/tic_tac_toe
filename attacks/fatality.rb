class Fatality
  def self.execute game
    return true if horizontal_fatality game
    return true if vertical_fatality game
    return true if diagonal_fatality game
    return false
  end

  private
  def self.horizontal_fatality game
    row = 0

    while row < 3 do
      if (game[row].count 0) == 2 && (game[row].count 1) == 0
        game[row][0] = 0 if game[row][0] == "*"
        game[row][1] = 0 if game[row][1] == "*"
        game[row][2] = 0 if game[row][2] == "*"

        return true 
      end
      
      row += 1
    end

    return false
  end

  def self.vertical_fatality game
    column = 0

    while column < 3 do
      column_elements = [game[0][column], game[1][column], game[2][column]]

      if (column_elements.count 0) == 2 && (column_elements.count 1) == 0
        game[0][column] = 0 if game[0][column] == "*"
        game[1][column] = 0 if game[1][column] == "*"
        game[2][column] = 0 if game[2][column] == "*"

        return true
      end

      column += 1
    end

    return false
  end

  def self.diagonal_fatality game
    return true if main_diagonal_fatality game
    return true if secundary_diagonal_fatality game
  end

  def self.main_diagonal_fatality game
    main_diagonal_elements = [game[0][0], game[1][1], game[2][2]]

    if (main_diagonal_elements.count 0) == 2 && (main_diagonal_elements.count 1) == 0
      game[0][0] = 0 if game[0][0] == "*"
      game[1][1] = 0 if game[1][1] == "*"
      game[2][2] = 0 if game[2][2] == "*"

      return true
    end

    return false
  end

  def self.secundary_diagonal_fatality game
    secundary_diagonal_elements = [game[2][0], game[1][1], game[0][2]]

    if (secundary_diagonal_elements.count 0) == 2 && (secundary_diagonal_elements.count 1) == 0
      game[2][0] = 0 if game[2][0] == "*"
      game[1][1] = 0 if game[1][1] == "*"
      game[0][2] = 0 if game[0][2] == "*"

      return true
    end

    return false
  end
end