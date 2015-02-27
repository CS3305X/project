class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to events, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:start_time, :end_time, :description, :location, :organiser_id, :confirmed_by_all, :users, :days)
    end
    
    def find_free_slots(users, meeting_start_date)
      free_slots_array = []
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
      end
      
      return free_slots_array
    end
    
    def is_available(user, date, hour)
      personal = Event.find_by_sql ["SELECT * FROM events WHERE DATE(start) = '?' 
                                    AND HOUR(start) = ? AND user_id = ?;", date, hour, user]
      classes = ClassSchedule.find_by_sql ["SELECT FROM registered_fors WHERE user_id = ? 
                                          AND module_code IN (SELECT module_code FROM class_schedules WHERE DATE(start_time) = '?' 
                                          AND HOUR(start_time) = ?);", user, date, hour]
      meetings = Meeting.find_by_sql ["SELECT * FROM attendings WHERE user_id = ? AND 
                                      meeting_id  IN (SELECT id FROM meetings WHERE DATE(start_time) = '?' 
                                      AND HOUR(start_time) = ?);", user, date, hour]
      
      if(personal.blank? && classes.blank? && meetings.blank?)
        return true
      else
        return false
      end
    end  
end
