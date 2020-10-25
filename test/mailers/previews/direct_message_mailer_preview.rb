class DirectMessageMailerPreview < ActionMailer::Preview
  def received_direct_message_email
    DirectMessageMailer.with(direct_message: DirectMessage.last!).received_direct_message_email
  end
end

