class PersonalEventsController < ApplicationController
  before_action :set_personal_event, only: [:show, :edit, :update, :destroy]

  # GET /personal_events
  # GET /personal_events.json
  def index
    @personal_events = PersonalEvent.all
  end

  # GET /personal_events/1
  # GET /personal_events/1.json
  def show
  end

  # GET /personal_events/new
  def new
    @personal_event = PersonalEvent.new
  end

  # GET /personal_events/1/edit
  def edit
  end

  # POST /personal_events
  # POST /personal_events.json
  def create
    @personal_event = PersonalEvent.new(personal_event_params)

    respond_to do |format|
      if @personal_event.save
        format.html { redirect_to @personal_event, notice: 'Personal event was successfully created.' }
        format.json { render :show, status: :created, location: @personal_event }
      else
        format.html { render :new }
        format.json { render json: @personal_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_events/1
  # PATCH/PUT /personal_events/1.json
  def update
    respond_to do |format|
      if @personal_event.update(personal_event_params)
        format.html { redirect_to @personal_event, notice: 'Personal event was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_event }
      else
        format.html { render :edit }
        format.json { render json: @personal_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_events/1
  # DELETE /personal_events/1.json
  def destroy
    @personal_event.destroy
    respond_to do |format|
      format.html { redirect_to personal_events_url, notice: 'Personal event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_event
      @personal_event = PersonalEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_event_params
      params.require(:personal_event).permit(:user_id, :event_name, :description, :location, :start_time, :end_time)
    end
end
