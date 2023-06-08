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
      require 'pry'; binding.pry
      if game[:season] == csv_array[:season]
        all_goals = score[:away_goals].to_i + score[:home_goals].to_i
        @goals_by_season[game[:season]]<< all_goals
      end
      require 'pry'; binding.pry
    end
  end

# get all the season keys out of the OG array hash
#Then iterate over the array hash again finding each of the games that have that season key
# from there 
#transform values { |v| v.sum}
end