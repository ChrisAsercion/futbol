require './lib/stat_tracker'
require './lib/game_stats'
require './lib/game_factory'
require "csv"

RSpec.describe GameStats do

  it 'exists' do
    x = StatTracker.new
    #y = GameStats.new
    x.from_csv('./data/teams.csv')
    require 'pry'; binding.pry
  end
end
