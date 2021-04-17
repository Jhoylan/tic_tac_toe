class Defense 
  def self.avoid_deadly_threat game
    return true if avoid_horizontal_deadly_threat game
    #return true if avoid_vertical_deadly_threat
    #return true if avoid_diagonal_deadly_threat
  end

  private 
  def self.avoid_horizontal_deadly_threat game
    for row in game do
      if (row.count 1) == 2 && (row.count 0) == 0
        row.map! { |element| element == "*" ? 0 : 1 }
        return true
      end
    end

    return false
  end
end