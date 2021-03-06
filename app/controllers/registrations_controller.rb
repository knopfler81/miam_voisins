class RegistrationsController < Devise::RegistrationsController

  private

  def update_resource(resource, params)
    if current_user.provider == "facebook"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  def sign_up_params
   params.require(:user).permit(:first_name, :last_name, :nickname, :avatar,:email, :password, :password_confirmation, :current_password)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :avatar, :email, :password, :password_confirmation, :current_password)
  end

end

