require './helpers/entries.rb'

class Level1
  def self.human_turn game
    is_a_valid_play = false

    while !is_a_valid_play do
      row = Entry.aks_for_a_row

      column = Entry.ask_for_a_column

      row -= 1
      column -= 1

      is_a_valid_play = CheckingIf.is_empty? game, row, column
    end

    game[row][column] = 1

    puts "You play"
  end

  def self.machine_turn game
    puts "Machine play"

    is_a_valid_play = false

    while !is_a_valid_play do
      row = rand(0..2)
      column = rand(0..2)
      is_a_valid_play = CheckingIf.is_empty? game, row, column
    end

    game[row][column] = 0
  end 
end

