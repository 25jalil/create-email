class ConversationsController < ApplicationController
	before_action :signed_in_user

	def new
		@users = User.all
	end

	def create
		if Conversation.between(current_user.id, params[:conversation][:recipient_id]).present?
			conversation = Conversation.between(current_user.id, params[:conversation][:recipient_id]).first
			message = conversation.messages.build(sender_id: current_user.id, title: params[:conversation][:title],body: params[:conversation][:body], attachment: params[:conversation][:attachment])
			if message.save
				flash[:success] = "Your message was successfully sent to the user #{params[:conversation][:user_to_flash]}"
				redirect_to all_users_path
			else
				render 'home_pages/home'
			end
		else
			conversation = Conversation.create(sender_id: current_user.id, recipient_id: params[:conversation][:recipient_id])
			message = conversation.messages.build(sender_id: current_user.id, title: params[:conversation][:title],body: params[:conversation][:body], attachment: params[:conversation][:attachment])
			if message.save
				flash[:success] = "Your message was successfully sent to the user #{params[:conversation][:user_to_flash]}"
				redirect_to all_users_path
			else
				render 'home_pages/home'
			end
    end
	end

	private

		def conversation_params
			params.require(:conversation).permit(:recipient_id, :body, :title, :user_to_flash, :attachment)
		end
end
