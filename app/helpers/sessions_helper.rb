module SessionsHelper
  def login(user_id)
    session[:user_id] = user_id
  end

  def current_user
    @user = User.find_by(username: session[:username]) if session[:username]
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.delete(:username)
  end
end
