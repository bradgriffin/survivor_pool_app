module EntriesHelper

	def has_selections?(entry)
		entry.selections.exists?
	end

  def has_selections_for_week?(entry, entry_week)
    if has_selections?(entry)
      @selected_games = entry.selections
      @selected_games.each do |selection|
        @game = Schedule.find(selection.schedule_id)
        @game_found = true if @game.week === entry_week
      end
      if @game_found === true
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def selection_by_week(entry, entry_week)
    @selected_games = entry.selections
    @selected_games.each do |selection|
      @game = Schedule.find(selection.schedule_id)
      if @game.week === entry_week
        @selected_game = selection
      end
    end
  end

	def is_current_week?(week)
		week === current_week(@current_time)
	end

  def opposing_team(picked_team, week)
    @team_game = Schedule.find(:all, :conditions => ["week = ? AND (away_team_id = ? OR home_team_id = ?)", 
                              week, picked_team.id, picked_team.id])
    if @team_game.first.away_team_id === picked_team.id
      @opposing_team_id = @team_game.first.home_team_id
    else
      @opposing_team_id = @team_game.first.away_team_id
    end
    @opposing_team = Team.find(@opposing_team_id)
    return "#{@opposing_team.location} #{@opposing_team.nickname}"
  end 

  def game_result(game, selection)
    @result = game.result
    if @result.winning_team_id === nil
      return "Game not played"
    elsif @result.winning_team_id === selection
      return "Win"
    else
      return "Loss"
    end
  end
end