class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    redirect_to new_user_path
  end

  def new
  end

  def create
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now.alert = @user.full_error_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
