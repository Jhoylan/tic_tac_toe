class Boomerang
  def self.first_step game
    if is_possible? game
      first_quadrant_boomerang_first_step game
      second_quadrant_boomerang_first_step game
      third_quadrant_boomerang_first_step game
      fourth_quadrant_boomerang_first_step game
      
      return true
    end

    return false
  end

  def self.second_step game
    if (game[1][1] != 1) && (is_possible? game) 
      game[1][1] = 0 
      return true
    end

    return false
  end

  private
  def self.is_possible? game
    return true if game[0][0] == 0 && (game[0][1] == 1 || game[1][0] == 1)
    return true if game[2][0] == 0 && (game[1][0] == 1 || game[2][1] == 1)    
    return true if game[0][2] == 0 && (game[0][1] == 1 || game[1][2] == 1)
    return true if game[2][2] == 0 && (game[2][1] == 1 || game[1][2] == 1)     
    return false
  end

  def self.first_quadrant_boomerang_first_step game
    set_boomerang_first_step game, 0, 2, 0, 1, 1, 2 if game[0][2] == 0 
  end

  def self.second_quadrant_boomerang_first_step game
    set_boomerang_first_step game, 0, 0, 0, 1, 1, 0 if game[0][0] == 0
  end

  def self.third_quadrant_boomerang_first_step game
    set_boomerang_first_step game, 2, 0, 2, 1, 1, 0 if game[2][0] == 0
  end

  def self.fourth_quadrant_boomerang_first_step game
    set_boomerang_first_step game, 2, 2, 2, 1, 1, 2 if game[2][2] == 0
  end

  def self.set_boomerang_first_step game, row_machine, column_machine, possible_first_row_opponent, possible_first_column_opponent, 
    possible_second_row_opponent, possible_second_column_opponent

    if game[possible_first_row_opponent][possible_first_column_opponent] == 1 || game[possible_second_row_opponent][possible_second_column_opponent] == 1

      row_opponent = possible_first_row_opponent
      column_opponent =  possible_first_column_opponent
      
      if  game[possible_second_row_opponent][possible_second_column_opponent] == 1
        row_opponent = possible_second_row_opponent
        column_opponent = possible_second_column_opponent
      end

      first_mark game, row_machine, column_machine, row_opponent, column_opponent

      return true
    end

    return false
  end

  def self.first_mark game, row_machine, column_machine, row_opponent, column_opponent
    if column_machine == column_opponent
      game[row_machine][1] = 0
    end

    if row_machine == row_opponent
      game[1][column_machine] = 0
    end
  end
end