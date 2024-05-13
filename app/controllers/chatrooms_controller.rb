class ChatroomsController < ApplicationController
  before_action :set_source

  def show
    @guild = @chatroom.guild || @chatroom.game.guild
    @game = @chatroom.game
    @messages = @chatroom.messages.includes(:member).order(created_at: :asc).limit(100).reverse
    @message = Message.new
    authorize @chatroom
  end

  private

  def set_source
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.guild.nil?
      @source = @chatroom.game || Game.find(params[:game_id])
    else
      @source = @chatroom.guild || Guild.find(params[:guild_id])
    end
  end
end
