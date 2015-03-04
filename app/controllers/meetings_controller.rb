class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  before_filter :logged
  
  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.find_by_sql ["SELECT * FROM meetings WHERE id IN (SELECT meeting_id FROM attendings WHERE user_id = ? AND confirmed = true) ORDER BY start_time", session[:user_id]]
    #@unconfirmed = Meeting.find_by_sql ["SELECT * FROM meetings WHERE id IN (SELECT meeting_id FROM attendings WHERE user_id = ? AND confirmed = false) ORDER BY start_time", session[:user_id]]
    @unconfirmed = Attending.find_by_sql ["SELECT * FROM attendings WHERE user_id = ? AND confirmed = false", session[:user_id]]
    @unconfirmed_details = Meeting.find_by_sql ["SELECT * FROM meetings WHERE id IN (SELECT meeting_id FROM attendings WHERE user_id = ? AND confirmed = false) ORDER BY start_time", session[:user_id]]
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end
  
  # GET /meetings/new
  def new
    @meeting = Meeting.new
    #@algorithm_result = 1
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @algorithm_result = params[:meeting][:algorithm]
    if(@algorithm_result.to_i == 1) 
      scheduler
    else
      start_time = params[:meeting][:start_time]

      end_time = (start_time.to_datetime + 1.hour).to_datetime
      @meeting = Meeting.new
      @meeting.start_time = start_time
      @meeting.end_time = end_time
      @meeting.description = session[:description]
      @meeting.organiser_id = current_user.id
      @meeting.organiser_name = "#{@current_user.first_name} #{@current_user.last_name}"
      @meeting.location = session[:location]

      respond_to do |format|
        if @meeting.save
          users = session[:users_for_meeting]
      
          users.each do |user|
            if(user != current_user.id)
              @attendings = Attending.create(user_id: user, meeting_id: @meeting.id, confirmed: false)
              notification_message = "#{@meeting.organiser_name} has invited you to #{@meeting.description} on #{@meeting.start_time.strftime("%A, %e %B at %k:%M")} in #{@meeting.location}"
              @notifications = Notification.create(user_id: user, message: notification_message)
            else
              @attendings = Attending.create(user_id: user, meeting_id: @meeting.id, confirmed: true)
            end
          end
          format.html { redirect_to meetings_path, notice: 'Meeting was successfully created.' }
          format.json { render :show, status: :created, location: @meeting }
        else
          format.html { render :new }
          format.json { render json: @meeting.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def scheduler
    @algorithm_result = 0
    session[:results] = find_free_slots(params[:meeting][:users], params[:meeting][:day])
    session[:description] = params[:meeting][:description]
    session[:location] = params[:meeting][:location]
    @meeting = Meeting.new
    @results = session[:results]
    render :scheduler
  end

  def find_free_slots(users_string, meeting_start_date)
    users = users_string.split(",")
    users << session[:user_id]
    session[:users_for_meeting] = users
    @invited_users = users
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
                                        AND DATE(finish) = ? AND (TIME(start) < '?:00:01' AND TIME(finish) > '?:59:59')", user, date, hour, hour]
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
  
  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meeting_params
    params.require(:meeting).permit(:start_time, :end_time, :description, :location, :organiser_id, :confirmed_by_all, :users, :days, :algorithm)
  end
end
