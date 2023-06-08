class TeamFactory
  attr_reader :teams

  def create_teams
    teams = []
    CSV.foreach('./data/teams.csv', headers: true, header_converters: :symbol) do |row|
      team_details = {
        :team_id => row[:team_id], 
        :franchise_id => row[:franchiseid],
        :team_name => row[:teamname],
        :abbreviation => row[:abbreviation], 
        :stadium => row[:stadium], 
        :link => row[:link]
      }
      teams.push(team_details)
    end
    teams
  end

end