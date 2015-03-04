module RegisteredForsHelper
    def showCredits
        user = User.find(session[:user_id])
        credits = user.credits
        credits
    end 
    
    def lecturer_name(id)
        lecturer = User.find_by(id: id)
        if !lecturer.nil?
            return "#{lecturer.first_name} #{lecturer.last_name}"
        else
           return id 
        end
    end
    
    def getName(module_code)
       subject = Subject.find_by(module_code: module_code) 
       subject.description
    end
    
    def getCredits(module_code)
        subject = Subject.find_by(module_code: module_code) 
        subject.credits
    end 
end