module MeetingsHelper
  def show_attendance(meeting)
     all_users = Attending.where(meeting_id: meeting)
     confirmed = Attending.where(meeting_id: meeting).where(confirmed: true)
      
      
            
     num_confirmed = confirmed.size
      total = all_users.size
     ("#{num_confirmed}/#{total}")
  end
end
