class MessagesController < ApplicationController

  def index
    @friends = Friendship.where(user_id: current_user.id, is_friend: true).ordered
    @friends += Friendship.where(friend_id: current_user.id, is_friend: true).ordered
    
  end

  def show
    if (Conversation.where(friendship_id: params[:id]).blank?)
      @conversation = Conversation.create(friendship_id: params[:id])
    end
    conversation = Conversation.where(friendship_id: params[:id])
    @messages = Message.where(conversation_id: conversation[0].id)
    @conversation = Conversation.find(conversation[0].id)
    @friendship = @conversation.friendship
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :conversation_id)
  end

end
