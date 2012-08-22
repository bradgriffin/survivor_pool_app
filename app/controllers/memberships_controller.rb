class MembershipsController < ApplicationController
def new
  	@member = Membership.new
  	@user = current_user
  end

  def create
  	@user = current_user
    pool = Pool.find_by_name(params[:membership][:name])
  	
    if pool && pool.authenticate(params[:membership][:password])
      @membership = pool.memberships.build("user_id" => @user.id)

    	if @membership.save
    		flash[:success] = "You have joined this pool!"
    		redirect_to current_user
    	else
    		flash[:error] = "Please try again"
    		redirect_to current_user
    	end
    else
      flash[:error] = "Pool does not exist"
      redirect_to new_pool_path
    end
  end

  def destroy
  end
end
