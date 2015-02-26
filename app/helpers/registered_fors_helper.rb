module RegisteredForsHelper
    def showCredits
        user = User.find(session[:user_id])
        credits = user.credits
        credits
    end 
end
