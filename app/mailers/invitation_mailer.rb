class InvitationMailer < ApplicationMailer
  def invitation_sent_email
    @invitation = params[:invitation]
    @availability = @invitation.availability
    @from = @invitation.from_user
    @to = @invitation.to_user
    @user = @to

    subject =
      if @invitation.requested?
        "#{@from} a demandé de rejoindre ton rendez-vous #{@availability}"
      else
        "#{@from} t'invite à rejoindre son rendez-vous #{@availability}"
      end

    mail(to: @to.email, subject: subject)
  end

  def invitation_accepted_email
    @invitation = params[:invitation]
    @availability = @invitation.availability
    @from = @invitation.from_user
    @to = @invitation.to_user
    @user = @from

    subject =
      if @invitation.requested?
        "#{@to} a accepté ta demande de rejoindre son rendez-vous #{@availability}"
      else
        "#{@to} a accepté ton invitation à rejoindre ton rendez-vous #{@availability}"
      end

    mail(to: @from.email, subject: subject)
  end
end
