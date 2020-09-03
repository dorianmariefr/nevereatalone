class MessagesController < ApplicationController
  load_and_authorize_resource

  def create
    @message.user = current_user

    if @message.save
      @message.users.without(current_user).each do |user|
        MessageMailer.with(message: @message, to: user).new_message_email.deliver_now
      end

      redirect_to @message.availability
    else
      redirect_to @message.availability, alert: @message.full_error_messages
    end
  end

  def destroy
    @message.destroy!

    redirect_to @message.availability
  end

  private

  def message_params
    params.require(:message).permit(:availability_id, :content)
  end
end
