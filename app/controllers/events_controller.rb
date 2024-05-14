class EventsController < ApplicationController
  before_action :set_source

  def index
    @games = Game.all
    @game = Game.find(params[:game_id]) if params[:game_id]
    @event = Event.new
    @events = policy_scope(Event)
    # This finds all events for the source (game or guild)
    @all_events = @source.events
    # If the source is an instance of Guild we only find events that are not associated with a game
    @source.is_a?(Guild) ? @all_events = @all_events.where(game: nil) : @all_events
    @guild = Game.find(params[:game_id]).guild if params[:game_id]
    @source.is_a?(Guild) ? @all_events = @all_events.where(game: nil) : @all_events.where(game: @source)
  end

  def show
    # Instantiates a new EventMember object for the form
    @games = Game.all
    @event_member = EventMember.new
    @event = Event.find(params[:id])
    @game = @event.game
    authorize @event
  end

  def new
    @game = Game.find(params[:game_id]) if params[:game_id]
    @event = Event.new
    @all_events = Event.all
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    # This sets the game for the event if the game_id is present in the params
    @event.game = Game.find(params[:game_id]) if params[:game_id].present?
    # This sets the guild for the event if the guild_id is present in the params, if not it sets it to game.guild
    @event.guild = params[:guild_id].present? ? Guild.find(params[:guild_id]) : @event.game.guild
    if @event.save
      redirect_back fallback_location: root_path, notice: 'Event created successfully'
    else
      render :new, status: :unprocessable_entity
    end
    authorize @event
  end

  def edit
    @event = Event.find(params[:id])
    @all_events = Event.all
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    @all_events = Event.all
    if @event.update(event_params)
      redirect_back fallback_location: root_path, notice: 'Event updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
    authorize @event
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to guild_path(current_user.member.guild)
    end
    authorize @event
  end

  private

  def event_params
    params.require(:event).permit(:name, :start, :end, :description)
  end

  def set_source
    if params[:game_id]
      @source = Game.find(params[:game_id])
    elsif params[:guild_id]
      @guild = Guild.find(params[:guild_id])
      @source = Guild.find(params[:guild_id])
    end
  end
end
