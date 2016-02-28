class MessagesController < ApplicationController
  before_action :signed_in_user

  def home
  end

  def all_mails
    @messages = Message.all_mails_model(current_user)
  end

  def sent_mails
    @messages = Message.sent_mails_model(current_user)
    render "all_mails"
  end

  def inbox_mails
    @messages = Message.inbox_mails_model(current_user)
    render "all_mails"
  end

  def show_message
    @message = Message.show_message_model(params[:message_id])
  end
end
