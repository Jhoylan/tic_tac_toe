require './defenses/advanced_traps.rb'

class Level4
  def self.machine_turn game, turn
    puts "Machine level 3 plays"

    if turn == 1
      return if MediumDefense.avoid_first_level_traps game
    end

    if turn == 3
      return if AdvancedDefence.avoid_second_level_traps game
    end

    return if BasicDefense.avoid_deadly_threat game

    is_a_valid_play = false

    while !is_a_valid_play do
      row = rand(0..2)
      column = rand(0..2)
      is_a_valid_play = CheckingIf.is_empty? game, row, column
    end

    game[row][column] = 0
  end 
end