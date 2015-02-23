module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    session[:name] = user.first_name
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def current_id
    current_user.id
  end 
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
