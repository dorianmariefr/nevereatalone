class InvitationsController < ApplicationController
  load_and_authorize_resource

  def create
    @invitation.user = current_user
    @invitation.status = "sent"

    if @invitation.save
      redirect_to root_path
    else
      redirect_to root_path, alert: @invitation.full_error_messages
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:availability_id)
  end
end
