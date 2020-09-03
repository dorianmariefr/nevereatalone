class UsersController < ApplicationController
  load_and_authorize_resource find_by: :slug

  def index
    redirect_to new_user_path
  end

  def show
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

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now.alert = @user.full_error_messages
      render :edit
    end
  end

  def destroy
    @user.destroy!

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :password,
      :image,
      :bio
    )
  end
end
