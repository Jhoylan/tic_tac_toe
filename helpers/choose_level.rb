class Level
  def self.choose
    puts "Please, choose your level"
    
    level = gets.chomp.to_i
    level = 1 if level == 0

    return level
  end
end