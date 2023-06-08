require './lib/game'
require "csv"
require './lib/stat_tracker'


RSpec.describe 'Game' do
  it 'can parce information' do
    ex_hash = [{:game_id=>"2012030221",
    :season=>"20122013",
    :type=>"Postseason",
    :date_time=>"5/16/13",
    :away_team_id=>"3",
    :home_team_id=>"6",
    :away_goals=>"2",
    :home_goals=>"3",
    :venue=>"Toyota Stadium",
    :venue_link=>"/api/v1/venues/null"}]
    
    x = StatTracker.new
    csv = CSV.parse(File.read('./data/games.csv'))
    csv_array_hash = x.from_csv(csv)
    allow(csv_array_hash).to receive(:from_csv).and_return(ex_hash)
    y = Game.new
    #require 'pry'; binding.pry
    y.average_number_of_goals(csv_array_hash)
    
  end

  it 'can average goals by season' do
    x = StatTracker.new
    csv = CSV.parse(File.read('./data/games.csv'))
    csv_array_hash = x.from_csv(csv)
    y = Game.new
    #require 'pry'; binding.pry
    y.average_goals_by_season(csv_array_hash)
  end

end