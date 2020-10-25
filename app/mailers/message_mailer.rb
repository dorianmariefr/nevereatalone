class MessageMailer < ApplicationMailer
  def new_message_email
    @message = params[:message]
    @to = params[:to]
    @availability = @message.availability
    @from = @message.user
    @user = @to

    subject = "Nouveau message pour ton rendez-vous #{@availability.to_s}"

    mail(to: @to.email, subject: subject)
  end
end
