require "csv"
require_relative 'team_factory'
require_relative 'game_teams_factory'
require_relative 'game_factory'

class StatTracker 
  
  def from_csv(path)
    if path == './data/games.csv'
    @game_factory = create_games_factory(path)
    elsif path == './data/teams.csv'
      @team_factory = create_teams_factory(path)
    else
      @game_teams_factory = create_game_teams_factory(path)
    end
  end

  def create_teams_factory(path)
    team_factory = TeamFactory.new
    team_factory.create_teams(path)
    team_factory
  end
  
  def create_games_factory(path)
    game_factory = GameFactory.new
    game_factory.create_games(path)
    game_factory
  end

  def create_game_teams_factory(path)
    game_teams_factory = GameTeamsFactory.new
    game_teams_factory.create_game_teams(path)
    game_teams_factory
  end

  def count_of_games_by_season
    games_by_season = {}
    @game_factory.games.each do |game|
      if games_by_season[game[:season]] != nil 
        games_by_season[game[:season]] += 1
      else 
        games_by_season[game[:season]] = 1
      end 
    end 
    games_by_season
  end 
  
  def look_up_team_name(team_id)
    team = @team_factory.teams.find do |team|
      team_id == team[:team_id]
    end
    team[:team_name]
  end

  def lowest_scoring_home_team
    lowest_home_scores = @game_factory.games.min_by do |game|
      game[:home_goals]
    end
    look_up_team_name(lowest_home_scores[:home_team_id])  
  end
end