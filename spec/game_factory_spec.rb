require './lib/game_factory'

RSpec.describe 'GameFactory' do
  it 'exists and has attributes' do
    game_factory = GameFactory.new

    expect(game_factory).to be_a(GameFactory)
    expect(game_factory.games).to be_a(Array)
    expect(game_factory.games[0]).to be_a(Game)
  end
end
