class PlayerManipulation
  def self.raffle_player
    player = rand(2)

    return "human" if player == 1
    return "machine" if player == 0
  end 

  def self.other_player player_turn
    return "human" if player_turn == "machine"
    return "machine"
  end 
end