class AppMailer < ActionMailer::Base
 
  default from: '2015teamproject'
 
  def welcome_email(current_user)
    @user = current_user
    mail(to: @user.email_address, subject: "Welcome!")
  end
end