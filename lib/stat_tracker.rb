require './lib/team_factory'
require './lib/game_teams_factory'
require './lib/game_factory'
require "csv"

class StatTracker 
  
  def from_csv(csv)
    team_id = csv[0].index("team_id")
    franchiseId = csv[0].index("franchiseId")
    teamName = csv[0].index("teamName")
    abbreviation = csv[0].index("abbreviation")
    stadium = csv[0].index("Stadium")
    link = csv[0].index("link")
      new_arr = csv.map do |team|
      {:team_id => team[team_id], 
      :franciseId => team[franchiseId],
      :abbreviation => team[abbreviation],
      :stadium => team[stadium], 
      :link => team[link]}
      end
      new_arr.drop(1)
  end

  def count_of_games_by_season(csv_array)
    @games_by_season = {}
    csv_array.each do |game|
      if @games_by_season[game[:season]] != nil 
        @games_by_season[game[:season]] += 1
      else 
        @games_by_season[game[:season]] = 1
      end 
    end 
  end 
end