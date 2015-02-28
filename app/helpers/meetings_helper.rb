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
      
    suitable_times = []
    index = 0
    
    for x in 9..17 #Check each hour from 9:00 to 17:00
      if(slots_which_suit_all[index] == 1)
        suitable_times << "#{meeting_start_date} #{x}:00:00".to_datetime
      end
      index+=1
    end
    
    return suitable_times
  end
    
  def is_available(user, date, hour)
    personal_starts = Event.where("DATE(start) = ?", date.to_date).
                                 where("HOUR(start) = ?", hour).
                                    where(user_id: user)
    
    if(hour < 10)
        personal_middle = Event.find_by_sql ["SELECT * FROM events WHERE user_id = ?
                                        AND DATE(finish) = ? AND (TIME(start) < '0?:00:01' AND TIME(finish) > '0?:00:01')", user, date, hour, (hour + 1)]
    else 
        personal_middle = Event.find_by_sql ["SELECT * FROM events WHERE user_id = ?
                                        AND DATE(finish) = ? AND (TIME(start) < '?:00:01' AND TIME(finish) > '?:00:01')", user, date, hour, (hour + 1)]
    end
                                        
    personal_ends = Event.find_by_sql ["SELECT * FROM events WHERE user_id = ?
                                        AND DATE(finish) = ? AND TIME(finish) BETWEEN '?:00:01' AND '?:59:59'", user, date, hour, hour]                        
                                    
    classes = ClassSchedule.find_by_sql ["SELECT * FROM registered_fors WHERE user_id = ? 
                                          AND module_code IN (SELECT module_code FROM class_schedules WHERE DATE(start_time) = ?
                                          AND HOUR(start_time) = ?)", user, date.to_date, hour]
    meetings = Meeting.find_by_sql ["SELECT * FROM attendings WHERE user_id = ? AND 
                                      meeting_id  IN (SELECT id FROM meetings WHERE DATE(start_time) = ? 
                                      AND HOUR(start_time) = ?)", user, date.to_date, hour]
                                      
                                      
      
    if(personal_starts.blank? && personal_middle.blank? && personal_ends.blank? && classes.blank? && meetings.blank?)
      return true
    else
      return false
    end
  end  
end
