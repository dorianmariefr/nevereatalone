class DirectMessagesController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @direct_messages = DirectMessage.between(@user, current_user)
      @direct_message = DirectMessage.new(to_user: @user)
    else
      @users = User.all
    end
  end

  def new
  end

  def create
    @direct_message.from_user = current_user

    if @direct_message.save
      redirect_to direct_messages_path(user_id: @direct_message.to_user_id)
    else
      flash.now.alert = @direct_message.full_error_messages
      render :new
    end
  end

  def destroy
    @direct_message.destroy!

    redirect_to direct_messages_path(user_id: @direct_message.to_user_id)
  end

  private

  def direct_message_params
    params.require(:direct_message).permit(:to_user_id, :content)
  end
end
