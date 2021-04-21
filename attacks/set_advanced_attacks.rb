class AdvancedAttacks
  def self.set game
    row = rand(2) * 2
    column = rand(2) * 2
    game[row][column] = 0
  end
end