require './lib/team_factory'
require './lib/game_teams_factory'
require './lib/game_factory'
require "csv"

class StatTracker 
  attr_reader :teams_array, :game_teams_array, :games_array
  
  def initialize
    @games_array = create_games_array
    @teams_array = create_teams_array
    @game_teams_array = create_game_teams_array
  end

  def create_games_array
    game_factory = GameFactory.new
    game_factory.create_games
   end

  def create_teams_array
    team_factory = TeamFactory.new
    team_factory.create_teams
  end  
  
  def create_game_teams_array
    game_teams_factory = GameTeamsFactory.new
    game_teams_factory.create_game_teams
  end

end