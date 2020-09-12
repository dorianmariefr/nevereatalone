class InvitationMailer < ApplicationMailer
  def invitation_sent_email
    @invitation = params[:invitation]
    @availability = @invitation.availability
    @from = @invitation.from_user
    @to = @invitation.to_user

    if @from == @invitation.availability.user
      subject = "#{@from.first_name} demande de rejoindre le rendez-vous "
    else
      subject = "#{@from.first_name} t'invite à rejoindre le rendez-vous "
    end

    subject += l(@availability.starts_at, format: "le %A %e %B à %kh%M")

    mail(to: @to.email, subject: subject)
  end

  def invitation_accepted_email
    @invitation = params[:invitation]
    @availability = @invitation.availability
    @from = @invitation.from_user
    @to = @invitation.to_user

    if @from == @invitation.availability.user
      subject = "#{@to.first_name} a accepté ta demande de rendez-vous "
    else
      subject = "#{@to.first_name} a accepté ton invitation au rendez-vous "
    end

    subject += l(@availability.starts_at, format: "le %A %e %B à %kh%M")

    mail(to: @from.email, subject: subject)
  end
end
