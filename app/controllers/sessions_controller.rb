class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #Re-direct to page
    else
      #Output an error message
      flash.now[:danger] = "Invalid email/password combination"
      #render the 'new' session page again: /sessions/new
      render 'new'
    end
  end
  
  def destroy
  end
end
