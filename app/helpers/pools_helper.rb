module PoolsHelper
  def auto_membership(pool)
    @user = current_user
    pool = Pool.find_by_name(pool.name)
    @membership = @pool.memberships.build("pool_id" => pool.id, "user_id" => @user.id)
    @membership.save
  end

  def entry_helper(entry)
    if entry.blank?
      "No entry"
    else
      @selection = Selection.find_by_entry_id(entry.id)
      link_to entry.name, entry_path(entry)
    end
  end

  def selection_helper(selection)
    if selection.blank?
      "No current selections"
    else
      @team = Team.find(@selection.selected_team_id)
      @team.nickname
    end
  end
end
