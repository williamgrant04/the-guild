class ChatroomsController < ApplicationController
  before_action :set_source

  def show
    @chatroom = Chatroom.find(params[:id])
    @guild = @chatroom.guild || @chatroom.game.guild
    @messages = @chatroom.messages.includes(:member).order(created_at: :asc).limit(100).reverse
    @message = Message.new
    authorize @chatroom
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
