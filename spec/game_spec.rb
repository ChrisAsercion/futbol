require './lib/game'
require "csv"
require './lib/stat_tracker'


RSpec.describe 'Game' do
  it 'can parce information' do
    x = StatTracker.new
    csv = CSV.parse(File.read('./data/games.csv'))
    csv_array_hash = x.from_csv(csv)
    y = Game.new
    y.average_number_of_goals(csv_array_hash)
    require 'pry'; binding.pry
  end

end