require './attacks/all_attacks.rb'
require './defenses/deadly_threats.rb'

class Level6
  def self.machine_turn game, turn
    puts "Joe level 6 plays"

    return if turn == 0 && (AdvancedAttacks.set game)    

    if turn == 2
      return if Conner.first_step game
      return if V.first_step game
      return if Boomerang.first_step game
    end

    return if Fatality.execute game
    
    if turn == 4      
      return if Conner.second_step game      
      return if V.second_step game      
      return if Boomerang.second_step game
    end

    return if BasicDefense.avoid_deadly_threat game
    return if BasicAtack.set_fatality game

    return Random.play game
  end 
end