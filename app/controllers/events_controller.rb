class EventsController < ApplicationController
  def new
    @event = Event.new
    @all_events = Event.all
  end

  def create
    @event = Event.new(event_params)
    # This sets the guild or game depending on what is in the params
    @event.game = params[:game_id] if params[:game_id].present?
    @even.guild = params[:guild_id] if params[:guild_id].present?
    if @event.save
      redirect_to root_path, notice: 'Event created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
    @all_events = Event.all
  end

  def update
    @event = Event.find(params[:id])
    @all_events = Event.all
    if @event.update(event_params)
      redirect_to root_path, notice: 'Event updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :start, :end, :description)
  end
end
