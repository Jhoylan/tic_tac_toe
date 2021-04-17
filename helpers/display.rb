class Display
  def self.game_status game
    puts "#{game[0][0]}  #{game[0][1]}  #{game[0][2]}"
    puts "#{game[1][0]}  #{game[1][1]}  #{game[1][2]}"
    puts "#{game[2][0]}  #{game[2][1]}  #{game[2][2]}"
    puts ""
  end  
end