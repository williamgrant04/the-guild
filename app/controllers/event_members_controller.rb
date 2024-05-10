class EventMembersController < ApplicationController
  before_action :set_source
  def new
    @event_member = EventMember.new
  end

  def create
    @event_member = EventMember.new(
      event: Member.find(event_member_params[:member]),
      member: Event.find(event_member_params[:event])
    )
    if @event_member.save
      if @source.is_a?(Game)
        redirect_to game_path(params[:game_id])
      elsif @source.is_a?(Guild)
        redirect_to guild_path(params[:guild_id])
      end
    else
      flash[:alert] = 'Something went wrong'
    end
  end

  def destroy
    @event_member.destroy
    redirect_back(fallback_location: guild_path(@guild))
  end

  private

  def event_member_params
    params.permit(:event, :member)
  end

  def set_source
    if params[:game_id]
      @source = Game.find(params[:game_id])
    elsif params[:guild_id]
      @source = Guild.find(params[:guild_id])
    end
  end
end
