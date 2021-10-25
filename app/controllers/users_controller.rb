class UsersController < ApplicationController
  before_action :set_security_params, only: :update_password

  def security_settings
  end

  def update_password
    current_user.password = params[:user][:password]
    current_user.password_confirmation = params[:user][:password_confirmation]

    if current_user.save!
      redirect_to root_path
    else
      redirect_to security_settings_users_path
    end
  end

  def user_show
  end

  def user_update
    current_user.name = params[:user][:name]
    current_user.about = params[:user][:about]
    current_user.gender = params[:user][:gender]
    current_user.email = params[:user][:email]

    if current_user.save!
      redirect_to show_friends_users_path
    else
      redirect_to security_settings_users_path
    end
  end

  def show_friends
    @users = User.where.not(id: current_user)
  end

  def show_friend
    @user = User.find(params[:user_id])
  end

  def user_search
    @users = User.where("name LIKE?", "%"+params["q"]+"%")
  end

  private
  def set_security_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
