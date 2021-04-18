class MediumAttack
  def self.set_fatality game
    return true if set_horizontal_fatality game
    return true if set_vertical_fatality game
    return true if set_diagonal_fatality game
  end

  private
  def self.set_horizontal_fatality game
    row = 0

    while row < 3
      if (game[row].count 0) == 1 && (game[row].count 1) == 0
        while true
          column = rand(3)

          if game[row][column] == "*"
            game[row][column] = 0
            return true
          end
        end

      end

      row += 1
    end

    return false
  end

  def self.set_vertical_fatality game
    column = 0

    while column < 3
      column_elements = [game[0][column], game[1][column], game[2][column]]

      if (column_elements.count 0) == 1 && (column_elements.count 1) == 0
        while true
          row = rand(3)

          if game[row][column] == "*"
            game[row][column] = 0
            return true
          end
        end

      end

      column += 1
    end

    return false
  end

  def self.set_diagonal_fatality game
    return true if set_main_diagonal_fatality game
    return true if set_secundary_diagonal_fatality game
  end

  def self.set_main_diagonal_fatality game
    main_diagonal_elements = [game[0][0], game[1][1], game[2][2]]

    if (main_diagonal_elements.count 0) == 1 && (main_diagonal_elements.count 1) == 0
      while true
        row_and_column = rand(3)

        if game[row_and_column][row_and_column] == "*"
          game[row_and_column][row_and_column] = 0
          return true
        end
      end
    end

    return false
  end

  def self.set_secundary_diagonal_fatality game
    main_diagonal_elements = [game[2][0], game[1][1], game[0][2]]

    if (main_diagonal_elements.count 0) == 1 && (main_diagonal_elements.count 1) == 0
      while true
        position = rand(3)

        case position
        when 0 
          if game[2][0] == "*"
            game[2][0] = 0
            break
          end
        when 1 
          if game[1][1] == "*"
            game[1][1] = 0
            break
          end
        when 2 
          if game[0][2] == "*"
            game[0][2] = 0
            break
          end
        end
      end
    end

    return false
  end
end