class MessageMailerPreview < ActionMailer::Preview
  def new_message_email
    MessageMailer.with(message: Message.last, to: User.last).new_message_email
  end
end
