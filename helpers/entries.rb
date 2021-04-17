class Entry
  def self.aks_for_a_row
    puts 'Please, choose a row'
    row = gets.chomp.to_i

    while row < 1 || row > 3
      puts 'please choose a valid row'
      row = gets.chomp.to_i
    end 

    return row
  end

  def self.ask_for_a_column
    puts 'Please, choose a column'
    column = gets.chomp.to_i

    while column < 1 || column > 3
      puts 'please choose a valid column'
      column = gets.chomp.to_i
    end 

    return column
  end
end