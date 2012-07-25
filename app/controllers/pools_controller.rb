class PoolsController < ApplicationController
  before_filter :signed_in_user, [:new, :create, :destroy]

  def new
  	@user = current_user
  end

  def index
  end

  def create
  	@pool = current_user.pools.build(params[:pools])

    if @pool.save
      flash[:success] = "Selection made!"
      redirect_to current_user
    else
      flash[:error] = "Try again"
      redirect_to current_user
    end
  end

  def destroy
  end
end
