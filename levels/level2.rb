require './attacks/set_fatality.rb'

class Level2
  def self.machine_turn game
    puts "Joe level 2 plays"

    return if BasicAtack.set_fatality game

    Random.play game
  end 
end