class AdvancedDefence
  def self.avoid_advanced_traps game
    return true if avoid_conner_trap game
    return false
  end

  def self.avoid_conner_trap game
    machine_marks_on_center = game[1][1] == 0
    opponent_set_a_conner_trap = game[0][0] == 1 && game[2][2] == 1 || game[0][2] == 1 && game[2][0] == 1 

    if machine_marks_on_center && opponent_set_a_conner_trap
      safe_position = rand(4)

      case safe_position
      when 0 
        game[0][1] = 0
      when 1
        game[2][1] = 0
      when 2 
        game[1][0] = 0
      when 3 
        game[1][2] = 0
      end

      return true
    end

    return false
  end
end