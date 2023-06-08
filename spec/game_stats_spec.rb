require './lib/game_stats'

RSpec.describe 'GameStats' do 

  it 'exists' do
    game_stats = GameStats.new([])

    expect(game_stats).to be_a(GameStats)
  end

  it 'can get the highest total score' do
    games = [
      Game.new({:away_goals => "2", :home_goals => "3"}),
      Game.new({:away_goals => "3", :home_goals => "4"}),
    ]

    game_stats = GameStats.new(games)
    expect(game_stats.highest_total_score).to eq(7)
  end
  
end
