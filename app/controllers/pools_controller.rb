class PoolsController < ApplicationController
  include PoolsHelper
  before_filter :signed_in_user, only: [:new, :create, :destroy]
  before_filter :pool_admin, only: [:edit, :update, :destroy]

  def new
  	@user = current_user
  end

  def index
  end

  def create
  	@pool = current_user.pools.build(params[:pools])

    if @pool.save
      flash[:success] = "Selection made!"
      auto_membership(@pool)
      redirect_to current_user
    else
      flash[:error] = "Try again"
      redirect_to new_pool_path
    end

  end

  def destroy
  end

  def show
    @user = current_user
    @current_pool = Pool.find(params[:id])
    @entries = Entry.find_all_by_pool_id(@current_pool.id)
    @memberships = Membership.find_all_by_pool_id(params[:id])
  end

  private

  def pool_admin
    @current_pool = Pool.find(params[:id])
    redirect_to(user_path) unless current_user?(@current_pool.user_id)
  end
end
