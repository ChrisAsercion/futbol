class Game
  
  def initialize(game)
    @game = game
    @away_goals = @game[:away_goals].to_i
    @home_goals = @game[:home_goals].to_i
  end

  def total_goals
    @away_goals + @home_goals
  end

  
end
