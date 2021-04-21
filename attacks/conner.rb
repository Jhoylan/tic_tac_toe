class Conner
  def self.first_step game
    if is_possible? game 
      mark_first_step game 
      return true
    end

    return false
  end

  def self.second_step game 
    if (is_possible? game) && (is_second_step_possible? game) 
      game[0][0] = 0 if game[0][0] == "*"
      game[2][0] = 0 if game[2][0] == "*"
      game[0][2] = 0 if game[0][2] == "*"
      game[2][2] = 0 if game[2][2] == "*"

      return true
    end 

    return false 
  end

  private
  def self.is_possible? game 
    return true if game[0][0] == 0 && (game[0][2] == 1 || game[2][0] == 1 || game[2][2] == 1)
    return true if game[2][0] == 0 && (game[0][0] == 1 || game[2][2] == 1 || game[0][2] == 1)    
    return true if game[0][2] == 0 && (game[0][0] == 1 || game[2][2] == 1 || game[2][0] == 1)
    return true if game[2][2] == 0 && (game[2][0] == 1 || game[0][2] == 1 || game[0][0] == 1)     
    return false
  end

  def self.mark_first_step game 
    if game[2][2] == 0
      if game[2][0] == 1
        game[0][2] = 0
        return
      end

      if game[0][2] == 1
        game[2][0] = 0
        return
      end

      if game[0][0] == 1
        position = rand(2)

        if position == 0
          game[2][0] = 0
          return
        end

        game[0][2] = 0
        return
      end
    end  
    
    if game[0][2] == 0
      if game[2][2] == 1
        game[0][0] = 0
        return
      end

      if game[0][0] == 1
        game[2][2] = 0
        return
      end

      if game[2][0] == 1
        position = rand(2)

        if position == 0
          game[2][2] = 0
          return
        end

        game[0][0] = 0
        return
      end
    end

    if game[0][0] == 0
      if game[0][2] == 1
        game[2][0] = 0
        return
      end

      if game[2][0] == 1
        game[0][2] = 0
        return
      end

      if game[2][2] == 1
        position = rand(2)

        if position == 0
          game[0][2] = 0
          return
        end

        game[2][0] = 0
        return
      end
    end

    if game[2][0] == 0
      if game[2][2] == 1
        game[0][0] = 0
        return
      end

      if game[0][0] == 1
        game[2][2] = 0
        return
      end

      if game[0][2] == 1
        position = rand(2)

        if position == 0
          game[2][2] = 0
          return
        end

        game[0][0] = 0
        return
      end
    end
  end

  def self.is_second_step_possible? game 
    conners = [game[0][0], game[0][2], game[2][0], game[2][2]]

    return true if (conners.count "*") == 1
  end
end