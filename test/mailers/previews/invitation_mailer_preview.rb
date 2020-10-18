class InvitationMailerPreview < ActionMailer::Preview
  def invitation_sent_email
    InvitationMailer.with(invitation: Invitation.last).invitation_sent_email
  end

  def invitation_accepted_email
    InvitationMailer.with(invitation: Invitation.last).invitation_accepted_email
  end
end
