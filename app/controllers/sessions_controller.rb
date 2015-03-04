class SessionsController < ApplicationController

  def new
  end
  
  #Create a new session for the logged in user
  def create
    user = User.find_by(id: params[:session][:id].downcase)
    if user && user.authenticate(params[:session][:password])
      #Re-direct to page
      log_in user
      redirect_to dashboard_path
    else
      #Output an error message. See /test/integration/users_login_test.rb for more
      flash.now[:danger] = "Invalid ID or Password"
      #render the 'new' session page (login) again: /sessions/new
      render 'new'
    end
  end
  
  #Destroy users session
  def destroy
    log_out if logged_in?
    redirect_to login_url
  end
end