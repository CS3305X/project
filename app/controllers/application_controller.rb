class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #Makes methods available from Applicationcontroller to those that do not inherit it? I think.
  include SessionsHelper
  helper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def authorize
    unless admin?
      redirect_to error_url
      false
    end
  end
  
  def admin?
    true if session[:user_type_id] == "3"
  end 
  
  def logged_in?
    !current_user.nil?
  end
  helper_method :logged_in?
  def logged 
    unless logged_in?
      redirect_to login_url
      flash[:danger] = 'You need to be logged in to use this feature.'
    end
  end 
end
