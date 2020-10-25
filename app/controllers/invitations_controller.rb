class InvitationsController < ApplicationController
  load_and_authorize_resource

  def index
    redirect_to root_path
  end

  def create
    @availability = Availability.find(invitation_params[:availability_id])
    @to_user_ids = invitation_params[:to_user_id] || [@availability.user.id]
    @invitations = @to_user_ids.reject(&:blank?).map do |to_user_id|
      @invitation = Invitation.new(
        availability_id: invitation_params[:availability_id],
        to_user_id: to_user_id
      )
      @invitation.to_user_id ||= @invitation.availability.user
      @invitation.from_user = current_user
      @invitation.status = "sent"
      @invitation
    end

    if @invitations.any? && @invitations.map(&:save).all? { |result| result == true }
      @invitations.each do |invitation|
        InvitationMailer.with(invitation: invitation).invitation_sent_email.deliver_now
      end
      redirect_to @availability
    else
      redirect_to(
        @availability,
        alert: @invitations.first&.full_error_messages || "Aucun invité selectionné",
      )
    end
  end

  def accept
    @invitation = Invitation.find(params[:invitation_id])
    if @invitation.accepted? || @invitation.declined?
      return redirect_to(
        @invitation.availability,
        alert: "Tu as déjà repondu à cette invitation",
      )
    end
    @invitation.update!(status: :accepted)
    InvitationMailer.with(invitation: @invitation).invitation_accepted_email.deliver_now
    redirect_to @invitation.availability
  end

  def decline
    @invitation = Invitation.find(params[:invitation_id])
    if @invitation.accepted? || @invitation.declined?
      return redirect_to(
        @invitation.availability,
        alert: "Tu as déjà repondu à cette invitation",
      )
    end
    @invitation.update!(status: :declined)
    redirect_to @invitation.availability
  end

  private

  def invitation_params
    params.require(:invitation).permit(:availability_id, to_user_id: [])
  end
end
