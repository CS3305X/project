class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:id].downcase)
    if user && user.authenticate(params[:session][:password])
      #Re-direct to page
      log_in user
      redirect_to events_url
    else
      #Output an error message. See /test/integration/users_login_test.rb for more
      flash.now[:danger] = "Invalid id/password combination"
      #render the 'new' session page (login) again: /sessions/new
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to login_url
  end
end