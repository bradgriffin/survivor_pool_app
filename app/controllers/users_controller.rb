class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Welcome to the Survivor Pool!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  private
end
