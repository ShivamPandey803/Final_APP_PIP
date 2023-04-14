class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @events = Event.all
    render json: @events
  end
  
  def show
    @event = Event.find(params[:id])
    render json: @event
  end
  
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end
  
  def update
    @event = current_user.events.find(params[:id])
    if @event.update(event_params)
      render json: @event, status: :ok
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end
  
    private
  
    def event_params
      params.require(:event).permit(:name, :description, :date, :time, :location, :public, :budget)
    end
  end
  