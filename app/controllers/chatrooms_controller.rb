class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @guild = @chatroom.guild
    @messages = @chatroom.messages.includes(:member).order(created_at: :asc).limit(100).reverse
    @message = Message.new
    authorize @chatroom
  end
end
