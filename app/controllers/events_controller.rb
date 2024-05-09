class EventsController < ApplicationController
  before_action :set_source

  def index
    @events = policy_scope(Event)
    # This finds all events for the source (game or guild)
    @all_events = @source.events
    # If the source is an instance of Guild we only find events that are not associated with a game
    @source.is_a?(Guild) ? @all_events = @all_events.where(game: nil) : @all_events
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  def new
    @event = Event.new
    @all_events = Event.all
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    # This sets the guild or game depending on what is in the params
    @event.game = Game.find(params[:game_id]) if params[:game_id].present?
    @event.guild = Guild.find(params[:guild_id]) if params[:guild_id].present?
    if @event.save
      redirect_to root_path, notice: 'Event created successfully'
    else
      render :new, status: :unprocessable_entity
    end
    authorize @event
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

  def set_source
    if params[:game_id]
      @source = Game.find(params[:game_id])
    elsif params[:guild_id]
      @source = Guild.find(params[:guild_id])
    end
  end
end
