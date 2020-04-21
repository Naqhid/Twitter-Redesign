module SessionsHelper
  def logout
    session.delete(:user_id)
  end
end
