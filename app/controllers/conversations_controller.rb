class ConversationsController < ApplicationController
	before_action :signed_in_user

	def create
		if Conversation.between(current_user.id, params[:conversation][:recipient_id]).present?
			conversation = Conversation.between(current_user.id, params[:conversation][:recipient_id]).first
			message = conversation.messages.build(sender_id: current_user.id, body: params[:conversation][:body])
			if message.save
				flash[:success] = "You message succesful sending"
				redirect_to user_path(params[:conversation][:recipient_id])
			else
				render 'home_pages/home'
			end
		else
			conversation = Conversation.create(sender_id: current_user.id, recipient_id: params[:conversation][:recipient_id])
			message = conversation.messages.build(sender_id: current_user.id, body: params[:conversation][:body])
			if message.save
				flash[:success] = "You message succesful sending"
				redirect_to user_path(params[:recipient_id])
			else
				render 'home_pages/home'
			end
		end
	end

	private

		def conversation_params
			params.require(:conversation).permit(:recipient_id, :body)
		end
end
