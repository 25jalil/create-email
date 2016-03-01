class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user, foreign_key: :sender_id

  validates_presence_of :title, :body, :conversation_id, :sender_id

  scope :all_mails_model, -> (user) do
    includes(:user, :conversation)
    .joins(:conversation)
    .where("conversations.sender_id =? OR conversations.recipient_id =?",user.id,user.id)
  end

  scope :sent_mails_model, -> (user) do
    includes(:user)
    .where(sender_id: user)
    .joins(:conversation)
    .where("conversations.sender_id =? OR conversations.recipient_id =?",user.id,user.id)
  end

  scope :inbox_mails_model, -> (user) do
    includes(:user)
    .where.not(sender_id: user)
    .joins(:conversation)
    .where("conversations.sender_id =? OR conversations.recipient_id =?",user.id,user.id)
  end

  scope :show_message_model, -> (message) do
    includes(:conversation)
    .select('messages.title, messages.body, messages.created_at, messages.conversation_id')
    .joins(:conversation)
    .find_by_id(message)
  end
end
