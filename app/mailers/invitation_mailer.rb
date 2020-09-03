class InvitationMailer < ApplicationMailer
  def invitation_sent_email
    @invitation = params[:invitation]
    @availability = @invitation.availability
    @from = @invitation.user
    @to = @availability.user
    subject = "#{@from.full_name} demande de rejoindre le rendez-vous "
    subject += l(@availability.starts_at, format: "le %A %e %B à %kh%M")

    mail(to: @to.email, subject: subject)
  end

  def invitation_accepted_email
    @invitation = params[:invitation]
    @availability = @invitation.availability
    @from = @invitation.user
    @to = @availability.user
    subject = "#{@to.full_name} a accepté ta demande de rendez-vous "
    subject += l(@availability.starts_at, format: "le %A %e %B à %kh%M")

    mail(to: @from.email, subject: subject)
  end
end
