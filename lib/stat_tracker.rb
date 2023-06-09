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
  end



  def create_game_teams_array(path)
    game_teams_factory = GameTeamsFactory.new
    game_teams_factory.create_game_teams(path)
    game_teams_factory.game_teams
  end


  def highest_scoring_visitor(csv, csv2)
    highest_scores = {}
    require 'pry'; binding.pry
    csv.each do |game|
      if highest_scores[game[:away_team_id]] == nil
        highest_scores[game[:away_team_id]] = []
        highest_scores[game[:away_team_id]] << game[:away_goals].to_i
      else 
        highest_scores[game[:away_team_id]] << game[:away_goals].to_i
      end
    end
    highest_scores.transform_values! {|v| v.sum.to_f / v.count}
    highest_scores.transform_values! {|v| v.round(2)}
    top = highest_scores.values.find do |score|
      score == highest_scores.values.max
    end
    top_team_id = highest_scores.keys.find do |team|
      highest_scores[team] == top
    end
    top_team = csv2.find do |team|
      team[:team_id] == top_team_id
    end
    top_team[:team_name]
  end

  def highest_scoring_home_team(csv, csv2)
    highest_scores = {}
    csv.each do |game|
      if highest_scores[game[:home_team_id]] == nil
        highest_scores[game[:home_team_id]] = []
        highest_scores[game[:home_team_id]] << game[:home_goals].to_i
      else 
        highest_scores[game[:home_team_id]] << game[:home_goals].to_i
      end
    end
    highest_scores.transform_values! {|v| v.sum.to_f / v.count}
    highest_scores.transform_values! {|v| v.round(2)}
    top = highest_scores.values.find do |score|
      score == highest_scores.values.max
    end
    top_team_id = highest_scores.keys.find do |team|
      highest_scores[team] == top
    end
    top_team = csv2.find do |team|
      team[:team_id] == top_team_id
    end
    top_team[:team_name]
  end


#This method starts with a hash where the key is the team_id and the value is an array of the goals if home/away
#The value is then summed, averaged, and rounded.
#top is equal to the highest average score per game
#top_team_id finds the team_id associated with the highest average score per game
#The method then searches the othe csv to find the team associated with that team_id and assigns them to top_team
#return top_team[:team_name] for a string that represents the team name.

end