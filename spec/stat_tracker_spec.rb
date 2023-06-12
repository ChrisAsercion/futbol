require './lib/stat_tracker'
require "csv"
require 'spec_helper'

RSpec.describe 'Stat_Tracker' do
  
  let(:stat_tracker) { StatTracker.new }
  let(:path) { './data/games.csv' }
  let(:path_2) { './data/teams.csv' }
  let(:path_3) { './data/game_teams.csv' }

  # xit 'can establish data from csv' do
  #   csv = CSV.parse(File.read('./data/teams.csv'))
  #   p = StatTracker.new
  #   p.from_csv(csv)
  #   expect(p.from_csv(csv)).to be_a(Array)
  #   expect(p.from_csv(csv)[1]).to be_a(Hash)
  # end

  # xit 'can sort to which csv method is needed' do
  #   csv = CSV.parse(File.read('./data/teams.csv'))
  #   expect(csv[0][1]).to eq("franchiseId")
  #   csv2 = CSV.parse(File.read('./data/game_teams.csv'))
  #   expect(csv2[0][1]).to eq("team_id")
  # end

  # xit 'creates GameFactory with games as a hash' do
  #   stat_tracker = StatTracker.new
  #   stat_tracker.from_csv(path)
  # end

  # xit 'creates TeamFactory with team as a hash' do
  #   stat_tracker = StatTracker.new
  #   stat_tracker.from_csv(path_2)
  # end

  # xit 'creates GameTeamsFactory with game team as a hash' do
  #   stat_tracker = StatTracker.new
  #   stat_tracker.from_csv(path_3)
  # end

  context 'league_stats_methods' do
    let(:stat_tracker) { StatTracker.new }
    before do 
      stat_tracker.from_csv(path)
      stat_tracker.from_csv(path_2)
      stat_tracker.from_csv(path_3)
    end
  end

  it 'counts number of games by season' do 
    stat_tracker = StatTracker.new
    stat_tracker.from_csv(path)

    season_totals = {
      "20122013" => 806,
      "20132014" => 1323,
      "20142015" => 1319,
      "20152016" => 1321,
      "20162017" => 1317,
      "20172018" => 1355
      }
    expect(stat_tracker.count_of_games_by_season).to eq(season_totals)
  end

  it 'returns lowest scoring home team' do
    stat_tracker = StatTracker.new
    stat_tracker.from_csv(path)
    stat_tracker.from_csv(path_2)

    expect(stat_tracker.lowest_scoring_home_team).to eq("Sporting Kansas City")
  end
end