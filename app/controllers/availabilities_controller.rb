class AvailabilitiesController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def create
    @availability.user = current_user

    if @availability.save
      redirect_to root_path
    else
      redirect_to root_path, alert: @availability.full_error_messages
    end
  end

  def destroy
    @availability.destroy!

    redirect_to root_path
  end

  private

  def availability_params
    params.require(:availability).permit(:starts_at, :location, :details)
  end
end
