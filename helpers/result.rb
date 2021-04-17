require './helpers/verifications.rb'

class Result 
  def self.show game
    winner = -1
      
    winner = game[0][0] if CheckingIf.is_fulfilled? "first_row", game
    winner = game[1][0] if CheckingIf.is_fulfilled? "second_row", game
    winner = game[2][0] if CheckingIf.is_fulfilled? "third_row", game
    winner = game[0][0] if CheckingIf.is_fulfilled? "first_column", game
    winner = game[0][1] if CheckingIf.is_fulfilled? "second_column", game
    winner = game[0][2] if CheckingIf.is_fulfilled? "third_column", game
    winner = game[0][0] if CheckingIf.is_fulfilled? "main_diagonal", game
    winner = game[2][0] if CheckingIf.is_fulfilled? "secondary_diagonal", game

    return "The winner is the Machine" if winner == 0
    return "The winner is you" if winner == 1
    return "It's a draw"
  end  
end