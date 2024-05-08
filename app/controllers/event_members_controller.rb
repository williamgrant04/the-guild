class EventMembersController < ApplicationController
  before_action :set_event, :set_guild, :set_game
  def new
    @event_member = EventMember.new
  end

  def create
    @event_member = EventMember.new(event_member_params)
    if @event_member.save
      redirect_to @guild.find(params[:id])
    else
      root_path
    end
  end

  def destroy
    @event_member.destroy
    redirect_back(fallback_location: @guild_path)
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_guild
    @guild = Guild.find(params[:guild_id])
  end

  def event_member
    params.require(:event_member).permit(:event, :member)
  end
end
