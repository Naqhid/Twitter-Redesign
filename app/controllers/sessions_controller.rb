class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      login(@user.id)
      redirect_to home_path
    else
      flash.now[:message] = 'Please verify your submission'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
