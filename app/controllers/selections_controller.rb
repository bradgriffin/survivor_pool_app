class SelectionsController < ApplicationController
include SelectionsHelper

  def new
  	@current_time = Time.new
  	@schedules = Schedule.find_all_by_week(current_week(@current_time))
  end

  def create
    @current_time = Time.new
    @user = current_user
    @selected_team = params[:selected_team_id]
    @schedules = Schedule.find(:all, :conditions => ["week = ? AND (away_team_id = ? OR home_team_id = ?)", 
                              current_week(@current_time), 
                              @selected_team, @selected_team])
    @schedules.each do |s|
      @schedule = s.id
    end
    @entry = Entry.find(params[:entry_id])
    @hash = { "selected_team_id" => @selected_team, "schedule_id" => @schedule, "user_id" => @user.id }
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
    @current_time = Time.new
    @user = current_user
    @selected_team = params[:selected_team_id]
    @schedules = Schedule.find(:all, :conditions => ["week = ? AND (away_team_id = ? OR home_team_id = ?)", 
                              current_week(@current_time), 
                              @selected_team, @selected_team])
    @schedules.each do |s|
      @schedule = s.id
    end
    @entry = Entry.find(params[:entry_id])
    @hash = { "selected_team_id" => @selected_team, "schedule_id" => @schedule, "user_id" => @user.id }
    @selection = Selection.find(params[:selection_id])
    @selection.update_attributes(@hash)

    if @selection.save
      flash[:success] = "Updated selection!"
      redirect_to @entry
    else
      flash[:error] = "Try again"
      redirect_to @entry
    end
  end

end