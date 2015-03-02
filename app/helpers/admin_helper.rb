module AdminHelper
    def display_staff(user)
        if user.user_type_id == "2" && user.validated == null
            true
        end
    end 
end
