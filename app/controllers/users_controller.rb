class UsersController < ApplicationController

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Registration Succesful"
      redirect_to @user
    else
      render 'new'
    end
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
