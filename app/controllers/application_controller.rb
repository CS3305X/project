class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #Makes methods available from Applicationcontroller to those that do not inherit it? I think.
  include SessionsHelper
  
  def current_user
    @current_user = logged_in_user
  end

end
