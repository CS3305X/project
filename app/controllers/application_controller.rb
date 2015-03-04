class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #Makes methods available from Applicationcontroller to those that do not inherit it? I think.
  include SessionsHelper
  helper
  
  #create method called current_user
  def current_user
    #global variable current user or use find them by current session with user id
    @current_user ||= User.find_by(id: session[:user_id])
    @current_user
  end
  
  def authorize
    unless admin?
      redirect_to error_url
      false
    end
  end
  
  #Check to see if the current user is an admin or not /TODO has some bugs on creating new user
  def admin?
    true if session[:user_type_id] == "3"
    #current_user.user_type_id == 3 
  end  
  helper_method :admin?
  
  #Check if the current user is logged in
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
  
  #Check if user is student
  def is_student?
    current_user.user_type_id == 1
  end
  helper_method :is_student?
  
  #Check if user is lecturer
  def is_lecturer?
    current_user.user_type_id == 2
  end
  helper_method :is_lecturer?
  
  #Count number of users notifications to display on the menu bar
  def count_notifications
    notifications = Notification.find_by_sql ["SELECT * FROM notifications WHERE user_id = ?", current_user.id]
    return notifications.size
  end
  helper_method :count_notifications
end
