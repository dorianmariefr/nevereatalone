class InvitationMailerPreview < ActionMailer::Preview
  def invitation_sent_email_requested
    InvitationMailer.with(
      invitation: Invitation.requested.last!
    ).invitation_sent_email
  end

  def invitation_sent_email_invited
    InvitationMailer.with(
      invitation: Invitation.invited.last!
    ).invitation_sent_email
  end

  def invitation_accepted_email_requested
    InvitationMailer.with(
      invitation: Invitation.requested.last!
    ).invitation_accepted_email
  end

  def invitation_accepted_email_invited
    InvitationMailer.with(
      invitation: Invitation.invited.last!
    ).invitation_accepted_email
  end
end
