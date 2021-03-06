class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :avatar, :email, :password, :password_confirmtaion, :current_password)
  end
end
