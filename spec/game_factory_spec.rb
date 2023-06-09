require 'spec_helper'

RSpec.describe GameFactory do

  let(:path) { './data/games.csv' }
  let(:game_factory) { GameFactory.new }

  it 'exists and has attributes' do
    expect(game_factory).to be_a(GameFactory)
    expect(game_factory.games).to eq([])
  end 

  it 'parses CSV and returns an array of hashes' do
    game_factory.create_games(path)
    expect(game_factory.games.count).to_not eq(0)
    game_factory.games.each do |game|
      expect(game).to be_a(Hash)
    end
  end

  context 'instance_methods' do
    before do 
      game_factory.create_games(path)
    end

    it 'percentage home wins' do
      expect(game_factory.percentage_home_wins).to eq(43.50)
    end

    it 'percentage visitor wins' do
      expect(game_factory.percentage_visitor_wins).to eq(36.11)
    end   
  end

end