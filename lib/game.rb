class Game
  
  def initialize
    @all_goals = []
  end

  def average_number_of_goals(csv_array)
    csv_array.each do |game|
      @all_goals << game[:away_goals].to_i + game[:home_goals].to_i
    end
    total_goals = @all_goals.sum
    amount_of_games = @all_goals.length
    average_goals = total_goals.to_f / amount_of_games
    p average_goals
    require 'pry'; binding.pry
  end


end