class EntriesController < ApplicationController
	before_filter :signed_in_user, [:new, :create, :destroy]
	include SelectionsHelper

	def new
		@user = current_user
		@memberships = @user.memberships.find(:all)
    @pools_available = []
	end

	def create
		@entry = current_user.entries.build(params[:entries])
	    @entry.save

	    if @entry.save
	      flash[:success] = "Entry created!"
	      redirect_to entry_path(@entry)
	    else
	      flash[:error] = "Try again"
	      redirect_to current_user
	    end
	end

	def destroy
	end

	def show
		@entry = Entry.find(params[:id])
		@pool = Pool.find(@entry.pool_id)
		@user = User.find(@entry.user_id)
		@weeks = (1..17).entries
		@current_time = Time.new
		@schedules = Schedule.with_current_week
	end 

end