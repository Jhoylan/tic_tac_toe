require './helpers/all_helpers.rb'
require './levels/level1.rb'

class Main 
  def main
    @game = Create.tic_tac_toe

    @current_player = PlayerManipulation.raffle_player

    puts "The numbers '1s' are you choices and the '0s' are Machine choices"

    @level = Level.choose

    Display.game_status @game

    @turn_numbers = 0

    while true
      Play.human_turn @game if @current_player == "human"
      machine_turn @level if @current_player == "machine"

      @current_player = PlayerManipulation.other_player @current_player

      Display.game_status @game

      @turn_numbers += 1

      if CheckingIf.is_over? @game, @turn_numbers
        puts Result.show @game
        break
      end
    end
  end 

  def machine_turn level
    case level
    when 1
      Level1.machine_turn @game 
    end
  end
end