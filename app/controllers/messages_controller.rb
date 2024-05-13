class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    authorize @message
    @message.chatroom = @chatroom
    @message.member = current_user.member
    if @message.save
      redirect_to chatroom_path(@chatroom)
    else
      # This sucks ass for this but it works for now, not going to spend 2 hours making it look better, no time
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
