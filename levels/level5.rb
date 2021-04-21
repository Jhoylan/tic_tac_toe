require './attacks/all_attacks.rb'
require './defenses/deadly_threats.rb'

class Level5
  def self.machine_turn game, turn
    puts "Joe level 5 plays"
   

    return if turn == 0 && (Fifty.set game)     
    return if turn == 2 && (Fifty.first_step game)     
    
    return if Fatality.execute game
    return if BasicDefense.avoid_deadly_threat game
    
    return if turn == 4 && (Fifty.second_step game)
        
    return if BasicAtack.set_fatality game

    
    Random.play game
  end 
end