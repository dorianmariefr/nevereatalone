class AdminMailerPreview < ActionMailer::Preview
  def admin_notification_email_availability
    AdminMailer.with(model: Availability.last, user: User.last).admin_notification_email
  end

  def admin_notification_email_comment
    AdminMailer.with(model: Comment.last, user: User.last).admin_notification_email
  end

  def admin_notification_email_direct_message
    AdminMailer.with(model: DirectMessage.last, user: User.last).admin_notification_email
  end

  def admin_notification_email_interest
    AdminMailer.with(model: Interest.last, user: User.last).admin_notification_email
  end

  def admin_notification_email_invitation
    AdminMailer.with(model: Invitation.last, user: User.last).admin_notification_email
  end

  def admin_notification_email_message
    AdminMailer.with(model: Message.last, user: User.last).admin_notification_email
  end

  def admin_notification_email_user
    AdminMailer.with(model: User.last, user: User.last).admin_notification_email
  end
end
