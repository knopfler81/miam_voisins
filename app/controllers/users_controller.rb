class UsersController < ApplicationController
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :avatar, :email, :password, :password_confirmtaion, :current_password)
  end

end
