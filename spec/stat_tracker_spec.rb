require './lib/stat_tracker'
require "csv"


RSpec.describe 'Stat_Tracker' do
  
  let(:path) { './data/games.csv' }
  let(:path_2) { './data/teams.csv' }
  let(:path_3) { './data/game_teams.csv' }
  

  it 'idk' do
    stat_tracker = StatTracker.new
    
     stat_tracker.games_array
     stat_tracker.teams_array
     stat_tracker.game_teams_array
    
  end

end