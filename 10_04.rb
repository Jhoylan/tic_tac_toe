def create_tic_tac_toe_matrix
  first_row = ["*","*","*"]
  second_row = ["*","*","*"]
  third_row = ["*","*","*"]

  tic_tac_toe_matrix = [first_row, second_row, third_row]
end

def raffle_player
  player = rand(2)

  return "human" if player == 1
  return "machine" if player == 0
end

def game_status game
  puts "#{game[0][0]}  #{game[0][1]}  #{game[0][2]}"
  puts "#{game[1][0]}  #{game[1][1]}  #{game[1][2]}"
  puts "#{game[2][0]}  #{game[2][1]}  #{game[2][2]}"
  puts ""
end

def is_empty? game, row, column
  return true if game[row][column] == "*"
  return false
end

def aks_for_a_row
  puts 'Please, choose a row'
  row = gets.chomp.to_i

  while row < 1 || row > 3
    puts 'please choose a valid row'
    row = gets.chomp.to_i
  end 

  return row
end

def ask_for_a_column
  puts 'Please, choose a column'
  column = gets.chomp.to_i

  while column < 1 || column > 3
    puts 'please choose a valid column'
    column = gets.chomp.to_i
  end 

  return column
end

def human_turn game
  is_a_valid_play = false

  while !is_a_valid_play do
    row = aks_for_a_row

    column = ask_for_a_column

    row -= 1
    column -= 1

    is_a_valid_play = is_empty? game, row, column
  end

  game[row][column] = 1

  puts "You play"
end

def machine_turn game
  puts "Machine play"

  is_a_valid_play = false

  while !is_a_valid_play do
    row = rand(0..2)
    column = rand(0..2)
    is_a_valid_play = is_empty? game, row, column
  end

  game[row][column] = 0
end

def change_player player_turn
  return "human" if player_turn == "machine"
  return "machine"
end

def valid_positions first_position, second_position, third_position
  return first_position != "*" && second_position != "*" && third_position != "*"
end

def line_is_complete first_position, second_position, third_position
  if first_position == second_position && first_position == third_position && (valid_positions first_position, second_position, third_position)
    return true 
  end

  return false
end

def is_fulfilled? line, game
  case line
  when "first_row"
    return line_is_complete game[0][0], game[0][1], game[0][2]
  when "second_row"
    return line_is_complete game[1][0], game[1][1], game[1][2]
  when "third_row"
    return line_is_complete game[2][0], game[2][1], game[2][2]
  when "first_column"
    return line_is_complete game[0][0], game[1][0], game[2][0]    
  when "second_column"
    return line_is_complete game[0][1], game[1][1], game[2][1] 
  when "third_column"
    return line_is_complete game[0][2], game[1][2], game[2][2]
  when "main_diagonal"
    return line_is_complete game[0][0], game[1][1], game[2][2]
  when "secondary_diagonal"
    return line_is_complete game[2][0], game[1][1], game[0][2]    
  end
end

def result game
  winner = -1
    
  winner = game[0][0] if @first_row_is_fulfilled
  winner = game[1][0] if @second_row_is_fulfilled
  winner = game[2][0] if @third_row_is_fulfilled
  winner = game[0][0] if @first_column_is_fulfilled
  winner = game[0][1] if @second_column_is_fulfilled
  winner = game[0][2] if @third_column_is_fulfilled
  winner = game[0][0] if @main_diagonal_is_fulfilled
  winner = game[2][0] if @secundary_diagonal_is_fulfilled 

  return "The winner is the Machine" if winner == 0
  return "The winner is you" if winner == 1
  return "It's a draw"
end

def is_over? game, turn_numbers
  @first_row_is_fulfilled =          is_fulfilled? "first_row", game 
  @second_row_is_fulfilled =         is_fulfilled? "second_row", game 
  @third_row_is_fulfilled =          is_fulfilled? "third_row", game 
  @first_column_is_fulfilled =       is_fulfilled? "first_column", game 
  @second_column_is_fulfilled =      is_fulfilled? "second_column", game 
  @third_column_is_fulfilled =       is_fulfilled? "third_column", game 
  @main_diagonal_is_fulfilled =      is_fulfilled? "main_diagonal", game 
  @secundary_diagonal_is_fulfilled = is_fulfilled? "secondary_diagonal", game 

  any_row_is_fulfilled =      @first_row_is_fulfilled || @second_row_is_fulfilled || @third_row_is_fulfilled
  any_column_is_fulfilled =   @first_column_is_fulfilled || @second_column_is_fulfilled || @third_column_is_fulfilled 
  any_diagonal_is_fulfilled = @main_diagonal_is_fulfilled || @secundary_diagonal_is_fulfilled
  no_more_empty_spaces =      turn_numbers == 9 

  return true if any_row_is_fulfilled || any_column_is_fulfilled || any_diagonal_is_fulfilled || no_more_empty_spaces
  return false 
end

def main
  game = create_tic_tac_toe_matrix

  player_turn = raffle_player

  puts "The numbers '1s' are you choices and the '0s' are Machine choices"

  game_status game

  turn_numbers = 0

  while true
    human_turn game  if player_turn == "human"

    machine_turn game  if player_turn == "machine"

    player_turn = change_player player_turn

    game_status game

    turn_numbers += 1

    if is_over? game, turn_numbers
      puts result game
      break
    end
  end
end

main