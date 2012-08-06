class MembershipsController < ApplicationController
def new
  	@member = Membership.new
  	@user = current_user
  end

  def create
  	@pool = Pool.first
  	@membership = @pool.memberships.build(params[:memberships])

  	if @membership.save
  		flash[:success] = "You have joined this pool!"
  		redirect_to current_user
  	else
  		flash[:error] = "Please try again"
  		redirect_to current_user
  	end
  end

  def destroy
  end
end
