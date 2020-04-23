class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(username: params[:user][:username], fullname: params[:user][:fullname], photo: params[:user][:photo], coverimage: params[:user][:coverimage])
    if @user.save
      redirect_to home_path
      login(@user.id)
    else
      render 'new'
    end
  end
  def show
    @user = User.find(params[:id])
  end
end
