class ClassSchedulesController < ApplicationController
  before_action :set_class_schedule, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  #before_filter :authorize
  before_filter :logged

  # GET /class_schedules
  # GET /class_schedules.json
  def index
    if(is_student?)
      #Get Students Classes using the Registered_for table
      @class_schedules = ClassSchedule.find_by_sql ["SELECT * FROM class_schedules
                                                  WHERE module_code IN (SELECT module_code
			                                                                  FROM registered_fors
	                                                                      WHERE user_id = '?')", session[:user_id]]
		elsif(is_lecturer?)
		#Get Lecturer's Classes using the Lecturer ID in the Subjects Table
		  @class_schedules = ClassSchedule.find_by_sql ["SELECT * FROM class_schedules
		                                                WHERE module_code IN (SELECT module_code
		                                                                      FROM subjects
		                                                                      WHERE lecturer_id = '?')", session[:user_id]]
		elsif(admin?)
		  @class_schedules = ClassSchedule.all
	  end
  end

  # GET /class_schedules/1
  # GET /class_schedules/1.json
  def show
  end

  # GET /class_schedules/new
  def new
    @module_codes = []
    if(is_lecturer?)
      class_options = (Subject.find_by_sql ["SELECT module_code FROM subjects WHERE lecturer_id = ?", @current_user.id])
      
      class_options.each do |classobject|
        @module_codes << classobject.module_code
      end

    elsif(admin?)
      class_options = Subject.all
      
      class_options.each do |classobject|
        @module_codes << classobject.module_code
      end

    end
    @class_schedule = ClassSchedule.new
  end

  # GET /class_schedules/1/edit
  def edit
  end

  # POST /class_schedules
  # POST /class_schedules.json
  def create
    module_code = params[:class_schedule][:module_code]
    title = params[:class_schedule][:title]
    location = params[:class_schedule][:location]
    num_weeks = params[:class_schedule][:repeats].to_i
    start_date = params[:class_schedule][:date]
    start_time = params[:class_schedule][:time_s]
    end_time = params[:class_schedule][:time_e]
    
    @class_schedule = ClassSchedule.new(module_code: module_code, title: title, start_time: "#{start_date} #{start_time}".to_datetime, 
                                        end_time: "#{start_date} #{end_time}".to_datetime, location: location)
    
    @class_schedule.save

    
    while(num_weeks > 0)
      #Add 7 days to start and end times
      start_date = (start_date.to_date + 7.days).to_date
      
      @class_schedule = ClassSchedule.new(module_code: module_code, title: title, start_time: "#{start_date} #{start_time}".to_datetime, 
                                        end_time: "#{start_date} #{end_time}".to_datetime, location: location)
      @class_schedule.save
      num_weeks-=1
    end
    redirect_to events_path
  end

  # PATCH/PUT /class_schedules/1
  # PATCH/PUT /class_schedules/1.json
  def update
    respond_to do |format|
      if @class_schedule.update(class_schedule_params)
        format.html { redirect_to @class_schedule, notice: 'Class schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_schedule }
      else
        format.html { render :edit }
        format.json { render json: @class_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_schedules/1
  # DELETE /class_schedules/1.json
  def destroy
    @class_schedule.destroy
    respond_to do |format|
      format.html { redirect_to class_schedules_url, notice: 'Class schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_schedule
      @class_schedule = ClassSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_schedule_params
      params.require(:class_schedule).permit(:subjects_id, :module_code, :start_time, :end_time, :location, :cancelled, :repeats)
    end
end
