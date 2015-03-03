module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    session[:user_type_id] = user.user_type_id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
