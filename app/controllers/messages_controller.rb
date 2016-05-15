class MessagesController < ApplicationController
  
  before_action :redirect_if_not_logged_in

  #Create messages for chat in events show page
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save
    #@path is used for publishing to specific chat
    @path = chat_path(@chat)
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
