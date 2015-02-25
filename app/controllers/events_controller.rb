class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :delete, :destroy]

  respond_to :html, :js, :json

  def index
    if logged_in?
<<<<<<< HEAD
      @events = Event.where(user_id: current_id)
=======
      @events = Event.where(user_id: session[:user_id])
>>>>>>> moduleselect
    else
      redirect_to login_url
      flash[:notice] = 'You need to be logged in to use this feature.'
    end 
  end

  def new
    @event = Event.new
  end

  def create
    #@event = Event.create(event_params)
    @event = Event.new(event_params)
    @event.user_id = session[:user_id]
    @event.save
    
  end

  def update
    @event.update_attributes(event_params)
  end

  def destroy 
    @event.destroy
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :start, :finish,
        :all_day)
    end
end
