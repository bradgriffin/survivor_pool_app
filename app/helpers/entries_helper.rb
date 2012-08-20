module EntriesHelper

	def has_selections?(entry)
		entry.selections.exists?
	end

	def is_current_week?(week)
		week === current_week(@current_time)
	end

  def opposing_team(team, week)
    @game = Schedule.find(:all, :conditions => ["week = ? AND (away_team_id = ? OR home_team_id = ?)", 
                              week, team.id, team.id])
    if @game.first.away_team === team.id
      @opposing_team_id = @game.first.home_team_id
    else
      @opposing_team_id = @game.first.away_team_id
    end

    @opposing_team = Team.find(@opposing_team_id)
    return "#{@opposing_team.location} #{@opposing_team.nickname}"
  end 
end