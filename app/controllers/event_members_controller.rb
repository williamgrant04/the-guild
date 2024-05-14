class EventMembersController < ApplicationController
  before_action :set_source

  def create
    @event_member = EventMember.new
    @event_member.member = Member.find(params[:member])
    @event_member.event = Event.find(params[:event])
    if @event_member.save
      redirect_back(fallback_location: @guild, notice: 'Signed up successfully')
    else
      flash[:alert] = 'Something went wrong'
    end
    authorize @event_member
  end

  def destroy
    @event = Event.find(params[:id])
    @event_member = @event.event_members.find_by(member: current_user.member)
    if @event_member.destroy
      redirect_back(fallback_location: @source)
    end
    authorize @event_member
  end

  private

  def set_source
    if params[:game_id]
      @source = Game.find(params[:game_id])
    elsif params[:guild_id]
      @source = Guild.find(params[:guild_id])
    end
  end
end
