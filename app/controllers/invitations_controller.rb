class InvitationsController < ApplicationController
  load_and_authorize_resource

  def index
    redirect_to root_path
  end

  def create
    @invitation.from_user = current_user
    @invitation.to_user ||= @invitation.availability&.user
    @invitation.status = "sent"

    if @invitation.save
      InvitationMailer.with(invitation: @invitation).invitation_sent_email.deliver_now
      redirect_to @invitation.availability
    else
      redirect_to root_path, alert: @invitation.full_error_messages
    end
  end

  def accept
    @invitation = Invitation.find(params[:invitation_id])
    @invitation.update!(status: :accepted)
    InvitationMailer.with(invitation: @invitation).invitation_accepted_email.deliver_now
    redirect_to @invitation.availability
  end

  def decline
    @invitation = Invitation.find(params[:invitation_id])
    @invitation.update!(status: :declined)
    redirect_to @invitation.availability
  end

  private

  def invitation_params
    params.require(:invitation).permit(:availability_id, :to_user_id)
  end
end
