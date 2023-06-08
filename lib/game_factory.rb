require "csv"
require './lib/game'

class GameFactory
  attr_reader :games

  def initialize(filename = './data/games.csv')
    @raw_games = CSV.read(filename, headers: true, header_converters: :symbol)
  end

  def games
    @games ||= @raw_games.map do |game|
      Game.new(game)

      require 'pry'; binding.pry
    end
  end
end
