class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #Makes methods available from Applicationcontroller to those that do not inherit it? I think.
  include SessionsHelper
  helper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    @current_user
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
  helper_method :admin?
  
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
  
  def is_student?
    current_user.user_type_id == 1
  end
  helper_method :is_student?
  
  def is_lecturer?
    current_user.user_type_id == 2
  end
  helper_method :is_lecturer?
end
