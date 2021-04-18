class CheckingIf
  def self.is_empty? game, row, column
    return true if game[row][column] == "*"
    return false
  end    

  def self.is_over? game, turn
    first_row_is_fulfilled          = is_fulfilled? "first_row", game
    second_row_is_fulfilled         = is_fulfilled? "second_row", game
    third_row_is_fulfilled          = is_fulfilled? "third_row", game
    first_column_is_fulfilled       = is_fulfilled? "first_column", game
    second_column_is_fulfilled      = is_fulfilled? "second_column", game
    third_column_is_fulfilled       = is_fulfilled? "third_column", game
    main_diagonal_is_fulfilled      = is_fulfilled? "main_diagonal", game
    secundary_diagonal_is_fulfilled = is_fulfilled? "secondary_diagonal", game

    any_row_is_fulfilled      = first_row_is_fulfilled || second_row_is_fulfilled || third_row_is_fulfilled
    any_column_is_fulfilled   = first_column_is_fulfilled || second_column_is_fulfilled || third_column_is_fulfilled 
    any_diagonal_is_fulfilled = main_diagonal_is_fulfilled || secundary_diagonal_is_fulfilled
    no_more_empty_spaces      = turn == 9 

    return true if any_row_is_fulfilled || any_column_is_fulfilled || any_diagonal_is_fulfilled || no_more_empty_spaces
    return false 
  end 

  private
  def self.line_is_completed? first_position, second_position, third_position
    if first_position == second_position && first_position == third_position && first_position != "*" 
      return true 
    end

    return false
  end

  def self.is_fulfilled? line, game
    case line
    when "first_row"
      return line_is_completed? game[0][0], game[0][1], game[0][2]
    when "second_row"
      return line_is_completed? game[1][0], game[1][1], game[1][2]
    when "third_row"
      return line_is_completed? game[2][0], game[2][1], game[2][2]
    when "first_column"
      return line_is_completed? game[0][0], game[1][0], game[2][0]    
    when "second_column"
      return line_is_completed? game[0][1], game[1][1], game[2][1] 
    when "third_column"
      return line_is_completed? game[0][2], game[1][2], game[2][2]
    when "main_diagonal"
      return line_is_completed? game[0][0], game[1][1], game[2][2]
    when "secondary_diagonal"
      return line_is_completed? game[2][0], game[1][1], game[0][2]    
    end
  end
end