require './helpers/all_helpers.rb'
require './levels/all_levels.rb'

class Main 
  def main
    @game = Create.tic_tac_toe

    @current_player = PlayerManipulation.raffle_player

    puts "The numbers '1s' are you choices and the '0s' are Machine choices"

    @level = Level.choose

    puts "level #{@level}"

    Display.game_status @game

    @turn = 0

    while true
      Play.human_turn @game if @current_player == "human"

      machine_turn if @current_player == "machine"

      @current_player = PlayerManipulation.other_player @current_player

      Display.game_status @game

      @turn += 1

      if CheckingIf.is_over? @game, @turn
        puts Result.show @game
        break
      end
    end
  end 

  def machine_turn 
    case @level
    when 1
      Level1.machine_turn @game 
    when 2
      Level2.machine_turn @game 
    when 3
      Level3.machine_turn @game
    when 4
      Level4.machine_turn @game, @turn
    when 5
      Level5.machine_turn @game, @turn
    when 6
      Level6.machine_turn @game, @turn
    when 7
      Level7.machine_turn @game, @turn
    when 8
      Level8.machine_turn @game, @turn
    when 9
      Level9.machine_turn @game, @turn
    when 10
      Level10.machine_turn @game, @turn
    when 100
      Level100.machine_turn @game, @turn
    else
      Level1.machine_turn @game
    end
  end
end

Main.new.main