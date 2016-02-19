class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'

  validates_presence_of :title, :body, :conversation_id, :sender_id

  scope :all_mails_to_user, -> (user) do
    select('sender_id','body').joins(:conversation).where("conversations.sender_id =? OR conversations.recipient_id =?",user.id,user.id)
  end
end
