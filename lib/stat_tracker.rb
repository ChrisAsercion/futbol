require "csv"

class StatTracker
  
  def from_csv(csv)
    if csv[0][1] == "franchiseId"
      teams_csv(csv)
    elsif csv[0][1] == "season"
      games_csv(csv)
    else #csv[0][1] == "team_id"
      game_teams_csv(csv)
    end
  end

  def teams_csv(csv)
    team_id = csv[0].index("team_id")
    franchiseId = csv[0].index("franchiseId")
    teamName = csv[0].index("teamName")
    abbreviation = csv[0].index("abbreviation")
    stadium = csv[0].index("Stadium")
    link = csv[0].index("link")
      new_arr = csv.map do |team|
      {:team_id => team[team_id], 
      :franciseId => team[franchiseId],
      :abbreviation => team[abbreviation],
      :stadium => team[stadium], 
      :link => team[link]}
      end
      new_arr.drop(1)

    #if teams ^^^

    #if games >>> game csv

    #elsif games teams >>> games_teams
  end

  def game_teams_csv(csv)
    game_id = csv[0].index("game_id")
    team_id = csv[0].index("team_id")
    hoa = csv[0].index("HoA")
    result = csv[0].index("settled_in")
    head_coach = csv[0].index("head_coach")
    goals = csv[0].index("goals")
    shots = csv[0].index("shots")
    tackles = csv[0].index("tackles")
    pim = csv[0].index("pim")
    power_play_opportunities = csv[0].index("powerPlayOpportunities")
    power_play_goals = csv[0].index("powerPlayGoals")
    face_off_win_percentage = csv[0].index("faceOffWinPercentage")
    giveaways = csv[0].index("giveaways")
    takeaways = csv[0].index("takeaways")
      new_arr = csv.map do |team|
      {:game_id => team[game_id], 
      :team_id => team[team_id],
      :HoA => team[hoa],
      :result => team[result], 
      :settled_in => team[settled_in]
      :head_coach => team[head_coach],
      :goals => team[goals], 
      :shots => team[shots],
      :tackles => team[tackles], 
      :pim => team[pim]}
      end
      new_arr.drop(1)
  end

  def games_csv(csv)
    game_id = csv[0].index("game_id")
    season = csv[0].index("season")
    type = csv[0].index("type")
    date_time = csv[0].index("date_time")
    away_team_id = csv[0].index("away_team_id")
    home_team_id = csv[0].index("home_team_id")
    away_goals = csv[0].index("away_goals")
    home_goals = csv[0].index("home_goals")
    venue = csv[0].index("venue")
    venue_link = csv[0].index("venue_link")
      new_arr = csv.map do |team|
      {:game_id => team[game_id], 
      :season => team[season],
      :type => team[type],
      :date_time => team[date_time], 
      :away_team_id => team[away_team_id], 
      :home_team_id => team[home_team_id], 
      :away_goals => team[away_goals], 
      :home_goals => team[home_goals], 
      :venue => team[venue],
      :venue_link => team[venue_link]}
      end
      new_arr.drop(1)
  end


end