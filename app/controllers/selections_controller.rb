class SelectionsController < ApplicationController
include SelectionsHelper

  def new
  	@current_time = Time.new
  	@schedules = Schedule.find_all_by_week(current_week(@current_time))
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

end