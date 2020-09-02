class SessionsController < ApplicationController
  def facebook
    uid = auth_hash["uid"]
    email = auth_hash["info"]["email"]
    image_url = auth_hash["info"]["image"]
    name = auth_hash["info"]["name"]
    first_name, last_name = name.split(" ", 2)

    @user = User.find_by(facebook_id: uid)
    @user ||= User.find_by(email: email)

    if @user
      @user.update!(facebook_id: uid) if @user.facebook_id.blank?
      session[:user_id] = @user.id
      redirect_to root_path
      return
    end

    @user = User.new(
      facebook_id: uid,
      email: email,
      first_name: first_name,
      last_name: last_name,
      password: SecureRandom.hex
    )

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_user_path, alert: @user.full_error_messages
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end
end
