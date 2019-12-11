class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    # require "pry"; binding.pry
    players = []
    @teams.each do |team|
      # require "pry"; binding.pry
      if team.eliminated? == false
        players << team.players_by_position(position)
      end
    end
    players.flatten
  end

end
