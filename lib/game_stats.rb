require './lib/game'

class GameStats 

  def initialize(games)
    @games = games
  end

  def highest_total_score
    @games.map do |game|
      game.total_goals
    end.max
  end
end
