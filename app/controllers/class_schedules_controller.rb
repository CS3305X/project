class ClassSchedulesController < ApplicationController
  before_action :set_class_schedule, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  before_filter :authorize
  before_filter :logged

  # GET /class_schedules
  # GET /class_schedules.json
  def index
    @class_schedules = ClassSchedule.find_by_sql ["SELECT * FROM class_schedules
                                                  WHERE module_code IN (SELECT module_code
			                                                                  FROM registered_fors
			                                                                  WHERE user_id = '?')", session[:user_id]]
  end

  # GET /class_schedules/1
  # GET /class_schedules/1.json
  def show
  end

  # GET /class_schedules/new
  def new
    @class_schedule = ClassSchedule.new
  end

  # GET /class_schedules/1/edit
  def edit
  end

  # POST /class_schedules
  # POST /class_schedules.json
  def create
    @class_schedule = ClassSchedule.new(class_schedule_params)

    respond_to do |format|
      if @class_schedule.save
        format.html { redirect_to @class_schedule, notice: 'Class schedule was successfully created.' }
        format.json { render :show, status: :created, location: @class_schedule }
      else
        format.html { render :new }
        format.json { render json: @class_schedule.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:class_schedule).permit(:subjects_id, :module_code, :start_time, :end_time, :location, :cancelled)
    end
end
