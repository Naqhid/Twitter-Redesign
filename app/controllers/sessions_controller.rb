class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      login(@user.id)
      redirect_to user_path(@user.id)
    else
      flash.now[:message] = 'Incorrect'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
