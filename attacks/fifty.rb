class Fifty
  def self.set game
    game[1][1] = 0
  end

  def self.first_step game
    if is_possible? game
      mark_first_step game
      return true
    end

    return false
  end 

  def self.second_step game
    if is_possible? game
      mark_second_step game
      return true
    end

    return false
  end

  private
  def self.is_possible? game
    return true if game[0][1] == 1 || game[1][0] == 1 || game[1][2] == 1 || game[2][1] == 1 
  end

  def self.mark_first_step game
    return if set_horizontal_fifty_v game
    return if set_vertical_fifty_v game
  end

  def self.set_horizontal_fifty_v game
    return true if mark_next_to game, 0
    return true if mark_next_to game, 2    
  end

  def self.mark_next_to game, row
    if game[row][1] == 1
      column = rand(2) * 2
      game[row][column] = 0 
      return true
    end

    return false
  end

  def self.set_vertical_fifty_v game
    if (game[1].count 1) == 1 && (game[1].count 0) == 1 
      row = rand(1) * 2

      game[row][0] = 0 if game[1][0] == 1
      game[row][2] = 0 if game[1][2] == 1

      return true
    end

    return false
  end

  def self.mark_second_step game
    count = 0

    while count < 2
      return if mark_row game, count * 2    
      return if mark_column game, count * 2

      count += 1
    end    
  end

  def self.mark_row game, row
    return false unless (game[row].count 0) == 1 && (game[row].count 1) == 0 
   
    position = rand(2)

    game[row][1] = 0 if position == 0
    game[row][2] = 0 if game[row][0] == 0 && position == 1         
    game[row][0] = 0 if game[row][2] == 0 && position == 1

    return true    
  end

  def self.mark_column game, column
    column_elements = [game[0][column], game[1][column], game[2][column]]

    return false unless (column_elements.count 0) == 1 && (column_elements.count 1) == 0     

    position = rand(2)    
      
    game[0][column] = 0 if game[2][column] == 0 && position == 0
    game[2][column] = 0 if game[0][column] == 0 && position == 0    
    game[1][column] = 0 if position == 1  
   
    return true
  end
end
