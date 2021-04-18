class V
  def self.first_step game
    if v_is_possible? game
      mark_first_step game 
      return true
    end

    return false
  end

  def self.second_step game
    game[1][1] = 0 if game[1][1] == "*"
  end
  
  private
  def self.v_is_possible? game 
    if game[0][0] == 0
      return true if game[1][2] == 1 || game[2][1] == 1 
    end

    if game[2][0] == 0
      return true if game[0][1] == 1 || game[1][2] == 1 
    end

    if game[0][2] == 0
      return true if game[1][0] == 1 || game[2][1] == 1 
    end

    if game[2][2] == 0
      return true if game[0][1] == 1 || game[1][0] == 1 
    end  

    return false
  end

  def self.mark_first_step game 
    if game[2][2] == 0
      game[0][2] = 0
      return
    end  
    
    if game[0][2] == 0
      game[0][0] = 0
      return
    end

    if game[0][0] == 0
      game[2][0] = 0
      return
    end

    if game[2][0] == 0
      game[2][2] = 0
      return
    end
  end
end