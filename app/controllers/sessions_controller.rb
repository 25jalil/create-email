class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:sessios][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      sign_in user
      redirect_to user
    else
      flash[:error] = 'invalid email/password_conbination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
