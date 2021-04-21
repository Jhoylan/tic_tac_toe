require './attacks/fatality.rb'
require './attacks/set_fatality.rb'
require './attacks/set_fatality.rb'

class Level100
  def self.machine_turn game, turn
    puts "Machine level 3 plays"

    return if Fatality.execute game
    return if turn == 0 && (Fifty.set game)
    return if turn == 2 && (Fifty.first_step game)
    return if turn == 4 && (Fifty.second_step game)

    Random.play game
  end 
end