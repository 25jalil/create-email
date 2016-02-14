class ConversationsController < ApplicationController
  before_action :signed_in_user

  def create

    conversation = Conversation.create(sender_id: current_user.id, recipient_id: params[:conversation][:recipient_id])
    message = conversation.messages.build(user_id: current_user.id, body: params[:conversation][:body])
    if message.save
      redirect_to root_path
    end
  end

  private

    def conversation_params
      params.require(:conversation).permit(:recipient_id, :body)
    end
end
