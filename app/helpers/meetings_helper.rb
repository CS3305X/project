module MeetingsHelper
  def find_free_slots(users, meeting_start_date)
      free_slots_array = []
      slots_which_suit_all = [1,1,1,1,1,1,1,1,1]
      user_num = 0
      
      users.each do |user|
        free_slots_array[user_num] = []
        timeslot = 0
        
        for i in 9..17 #Check each hour from 9:00 to 17:00
          if(is_available(user,meeting_start_date,i))
            #User is available at hour i, so insert 1 into relevant slot of array
            free_slots_array[user_num][timeslot] = 1
          else
            #User is busy at hour i so insert 0 into relevant slot of array
            free_slots_array[user_num][timeslot] = 0
          end
          timeslot+=1
        end
        user_num += 1
      end
      
      free_slots_array.each do |free_slots|
        for j in 0..8
          slots_which_suit_all[j] &= free_slots[j]
        end
      end
      
      return slots_which_suit_all
  end
    
    def is_available(user, date, hour)
        personal = Event.where("DATE(start) = ?", date.to_date).
                                 where("HOUR(start) = ?", hour).
                                    where(user_id: user)
      classes = ClassSchedule.find_by_sql ["SELECT * FROM registered_fors WHERE user_id = ? 
                                          AND module_code IN (SELECT module_code FROM class_schedules WHERE DATE(start_time) = ?
                                          AND HOUR(start_time) = ?)", user, date.to_date, hour]
      meetings = Meeting.find_by_sql ["SELECT * FROM attendings WHERE user_id = ? AND 
                                      meeting_id  IN (SELECT id FROM meetings WHERE DATE(start_time) = ? 
                                      AND HOUR(start_time) = ?)", user, date.to_date, hour]
      
      if(personal.blank? && classes.blank? && meetings.blank?)
        return true
      else
        return false
      end
    end  
end
