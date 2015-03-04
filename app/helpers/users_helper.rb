module UsersHelper
    def check_notifications(userid)
       @result =  Notification.where(user_id: userid)
    end
    
    def number_of_notifications(userid)
        
    end 
end
