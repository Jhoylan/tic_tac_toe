class Level
  def self.choose
    puts "Please, choose your level between 1 and 10"
    
    level = gets.chomp.to_i
    level = 1 if level == 0

    return level
  end
end