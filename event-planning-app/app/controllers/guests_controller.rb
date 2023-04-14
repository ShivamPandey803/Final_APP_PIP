class Api::GuestsController < ApplicationController
  before_action :set_event
  before_action :set_guest, only: [:update, :destroy]
    
  def index
    @guests = @event.guests
    render json: @guests
  end
    
  def create
    @guest = @event.guests.new(guest_params)
      
    if @guest.save
      render json: @guest, status: :created
    else
      render json: @guest.errors, status: :unprocessable_entity
    end
  end
    
  def update
    if @guest.update(guest_params)
      render json: @guest
    else
      render json: @guest.errors, status: :unprocessable_entity
    end
  end
    
  def destroy
    @guest.destroy
  end
    
    private
    
  def set_event
      @event = Event.find(params[:event_id])
  end
    
  def set_guest
    @guest = @event.guests.find(params[:id])
  end
    
  def guest_params
    params.require(:guest).permit(:name, :email, :rsvp)
  end
end
  