class HomePagesController < ApplicationController
  before_action :signed_in_user

  def home
  end

  def all_mails
    @mails = Message.all_mails_to_user(current_user)
  end

  def sent_mails
  end

  def inbox_mails
  end

  private

    def homepages_params
      params.require(:homepage).permit(:id)
    end
end
