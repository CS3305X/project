class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #Re-direct to page
      log_in user
<<<<<<< HEAD
      redirect_to events_url
=======
      redirect_to user
>>>>>>> 9f4ef2d63463475550ed8f03948fc2633cbab171
    else
      #Output an error message. See /test/integration/users_login_test.rb for more
      flash.now[:danger] = "Invalid email/password combination"
      #render the 'new' session page (login) again: /sessions/new
      render 'new'
    end
  end
  
  def destroy
  end
end