require './easy.rb'

class Defense 
  def initialize(game)
    @game = game
  end

  def avoid_horizontal_deadly_threat
    for row in @game do
      if row.count 1 == 2
        row.map! { |element| element = 0 if element == "*" }
        return true
      end
    end
  end

  def avoid_deadly_threat 
    return true if avoid_horizontal_deadly_threat
    return true if avoid_vertical_deadly_threat
    return true if avoid_diagonal_deadly_threat
  end
end