class GodLevelConner
  def self.first_step game
    if is_possible? game 
      mark_first_step game 
      return true
    end
  end

  def self.second_step game
    if is_second_step_possible? game
      mark_second_step game
      return true
    end
  end

  private
  def self.is_possible? game 
    return true if game[1][1] == 1
  end
  
  def self.mark_first_step game 
    mark_the_opposite 0, 0, game if game[0][0] == 0
    mark_the_opposite 0, 2, game if game[0][2] == 0
    mark_the_opposite 2, 0, game if game[2][0] == 0
    mark_the_opposite 2, 2, game if game[2][2] == 0
  end

  def self.mark_the_opposite row, column, game
    new_row = 0    if row == 2
    new_row = 2    if row == 0
    new_column = 0 if column == 2
    new_column = 2 if column == 0

    game[new_row][new_column] = 0
  end

  def self.is_second_step_possible? game
    machine_row    = 0
    machine_column = 2

    machine_row = 2 if game[2][2] == 0

    return true if !other_conners_are_empty? machine_row, machine_column, game
    return false
  end

  def self.other_conners_are_empty? machine_row, machine_column, game
    first_conner_is_empty  = true if game[machine_row][change machine_column] == "*"
    second_conner_is_empty = true if game[change machine_row][machine_column] == "*"

    return true if first_conner_is_empty && second_conner_is_empty
    return false
  end

  def self.change number
    return 2 if number == 0
    return 0 if number == 2
  end

  def self.mark_second_step game
    game[0][0] = 0 if game[0][0] == "*"
    game[2][0] = 0 if game[2][0] == "*"
    game[0][2] = 0 if game[0][2] == "*"
    game[2][2] = 0 if game[2][2] == "*"
  end
end