require './lib/team_factory'
require './lib/game_teams_factory'
require './lib/game_factory'
require "csv"

class StatTracker 
  
  def initialize
    # @teams = []
    # @game_teams = []
    # @games = []
  end

  def from_csv(path)
    if path == './data/games.csv'
      create_games_array(path)
    elsif path == './data/teams.csv'
      create_teams_array(path)
    else
      './data/game_teams.csv'
      create_game_teams_array(path)
    end
  end

  def create_teams_array(path)
    team_factory = TeamFactory.new
    team_factory.create_teams(path)
    team_factory.teams
    #require 'pry'; binding.pry
  end
  

  def create_games_array(path)
    game_factory = GameFactory.new
    game_factory.create_games(path)
    game_factory.games
    require 'pry'; binding.pry
  end



  def create_game_teams_array(path)
    game_teams_factory = GameTeamsFactory.new
    game_teams_factory.create_game_teams(path)
    game_teams_factory.game_teams
  end


end