require './lib/team_factory'
require './lib/game_teams_factory'
require './lib/game_factory'
require "csv"

class StatTracker 
  
  def initialize
    @teams = []
    @game_teams = []
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
    require 'pry'; binding.pry
  end
  

  def create_games_array(path)
   game_factory = GameFactory.new
   game_factory.create_games(path)
   require 'pry'; binding.pry
  end



  def create_game_teams_array(path)
    game_teams_factory = GameTeamsFactory.new
    game_teams_factory.create_game_teams(path)
    require 'pry'; binding.pry
  def highest_sum

  end

  def games_csv(csv)
    game_id = csv[0].index("game_id")
    season = csv[0].index("season")
    type = csv[0].index("type")
    date_time = csv[0].index("date_time")
    away_team_id = csv[0].index("away_team_id")
    home_team_id = csv[0].index("home_team_id")
    away_goals = csv[0].index("away_goals")
    home_goals = csv[0].index("home_goals")
    venue = csv[0].index("venue")
    venue_link = csv[0].index("venue_link")
      new_arr = csv.map do |team|
      {:game_id => team[game_id], 
      :season => team[season],
      :type => team[type],
      :date_time => team[date_time], 
      :away_team_id => team[away_team_id], 
      :home_team_id => team[home_team_id], 
      :away_goals => team[away_goals], 
      :home_goals => team[home_goals], 
      :venue => team[venue],
      :venue_link => team[venue_link]}
      end
      new_arr.drop(1)
  end


end