require './lib/game'
require "csv"


RSpec.describe 'Game' do
  it 'exists and has attributes' do
    game = Game.new({:game_id => "2012030221"})

    expect(game).to be_a(Game)
    expect(game.game_id).to eq("2012030221")
  end

  it "get the total goals" do
    game = Game.new({:away_goals => "2", :home_goals => "3"})
    expect(game.total_goals).to eq(5)
  end
end
