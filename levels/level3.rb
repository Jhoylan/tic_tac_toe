require './attacks/all_attacks.rb'

class Level3
  def self.machine_turn game
    puts "Joe level 3 plays"

    return if Fatality.execute game
    return if BasicAtack.set_fatality game

    Random.play game
  end 
end