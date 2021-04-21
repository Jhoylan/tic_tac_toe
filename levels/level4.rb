require './attacks/all_attacks.rb'

class Level4
  def self.machine_turn game, turn
    puts "Joe level 4 plays"

    return if turn == 0 && (Fifty.set game) 
    return if turn == 2 && (Fifty.first_step game) 

    return if Fatality.execute game

    return if turn == 4 && (Fifty.second_step game) 
        
    return if BasicAtack.set_fatality game

    Random.play game
  end 
end