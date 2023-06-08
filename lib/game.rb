class Game
  
  def initialize
    @all_goals = []
    @goals_by_season = {}
  end

  def average_number_of_goals(csv_array)
    csv_array.each do |game|
      @all_goals << game[:away_goals].to_i + game[:home_goals].to_i
    end
    total_goals = @all_goals.sum
    amount_of_games = @all_goals.count
    average_goals = total_goals.to_f / amount_of_games
    average_goals.round(2)
  end

  def average_goals_by_season(csv_array)
    total_goals = []
    csv_array.each do |game|
        #@goals_by_season[game[:season]] = []
        require 'pry'; binding.pry
      if game[:season] == csv_array[:season]
          #csv_array.each do |score|
            all_goals = score[:away_goals].to_i + score[:home_goals].to_i
            total_goals << all_goals
            average_goals == total_goals.to_f / total_goals.count
            @goals_by_season[game[:season]] = average_goals 
          #end
      end
      # else
      #   csv_array.each do |score|
      #     @goals_by_season[game[:season]] << score[:away_goals].to_i + score[:home_goals].to_i
      # end
      @goals_by_season[game[:season]]
    end
  end

  def average_goals_by_season(csv_array)
    csv_array.each do |game|
      @goals_by_season[game[:season]] = []
    end
    csv_array.each do |game|
      all_goals = game[:away_goals].to_i + game[:home_goals].to_i
      @goals_by_season[game[:season]]<< all_goals
    end
    @goals_by_season.transform_values! {|v| v.sum.to_f / v.count}
    @goals_by_season.transform_values! {|v| v.round(2)}
    require 'pry'; binding.pry
  end

#The first enumeration will assign a key to the @goals_by_season hash that is the number of the season and a value of and empty hash
#The 2nd enumeration will gather all goals in game and then add them to the array value that is associated to that season
#transform_values will display a new hash that averages then rounds
end