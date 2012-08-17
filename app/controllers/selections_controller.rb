class SelectionsController < ApplicationController
include SelectionsHelper

  def new
  	@current_time = Time.new
  	@schedules = Schedule.find_all_by_week(current_week(@current_time))
  end

  def create
    @user = current_user
    @selected_team = params[:selected_team_id]
    @entry = Entry.find(params[:entry_id])
    @hash = { "selected_team_id" => @selected_team, "schedule_id" => params[:schedule_id], "user_id" => @user.id }
    @selection = @entry.selections.build(@hash)

    if @selection.save
      flash[:success] = "Selection made!"
      redirect_to @entry
    else
      flash[:error] = "Try again"
      redirect_to @entry
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

end