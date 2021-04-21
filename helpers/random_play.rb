require './helpers/verifications.rb'

class Random
  def self.play game
    is_a_valid_play = false

    while !is_a_valid_play do
      row = rand(0..2)
      column = rand(0..2)
      is_a_valid_play = CheckingIf.is_empty? game, row, column
    end

    game[row][column] = 0
  end
end