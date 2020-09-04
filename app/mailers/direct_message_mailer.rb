class DirectMessageMailer < ApplicationMailer
  def received_direct_message_email
    @direct_message = params[:direct_message]
    @from_user = @direct_message.from_user
    @to_user = @direct_message.to_user

    mail(to: @to_user.email, subject: "Nouveau message de #{@from_user}")
  end
end
