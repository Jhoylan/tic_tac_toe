class Conner
  def self.first_step game
    if is_possible? game 
      mark_first_step game 
      return true
    end
  end

  def self.second_step game 
    game[0][0] = 0 if game[0][0] == "*"
    game[2][0] = 0 if game[2][0] == "*"
    game[0][2] = 0 if game[0][2] == "*"
    game[2][2] = 0 if game[2][2] == "*"

    return true
  end

  private
  def self.is_possible? game 
    if game[0][0] == 0
      return true if game[0][2] == 1 || game[2][0] == 1 || game[2][2]
    end

    if game[2][0] == 0
      return true if game[0][0] == 1 || game[2][2] == 1 || game[0][2] 
    end

    if game[0][2] == 0
      return true if game[0][0] == 1 || game[2][2] == 1 || game[2][0] 
    end

    if game[2][2] == 0
      return true if game[2][0] == 1 || game[0][2] == 1 || game[2][2] 
    end  

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
end