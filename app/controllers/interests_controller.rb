class InterestsController < ApplicationController
  load_and_authorize_resource

  def create
    @interest.user = current_user

    if @interest.save
      redirect_to current_user
    else
      redirect_to current_user, alert: @interest.full_error_messages
    end
  end

  def destroy
    @interest.destroy!

    redirect_to current_user
  end

  private

  def interest_params
    params.require(:interest).permit(:content)
  end
end
