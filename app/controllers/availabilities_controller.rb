class AvailabilitiesController < ApplicationController
  load_and_authorize_resource

  def index
    @current_user_availabilities = current_user.availabilities.recent
    @past_current_user_availabilities = current_user.availabilities.past
    @other_users_availabilities = Availability.where.not(user: current_user).recent
    @past_other_users_availabilities = Availability.where.not(user: current_user).past
    @availability = Availability.new(user: current_user)
  end

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
    params.require(:availability).permit(
      :starts_at,
      :location,
      :details,
      :vegetarian,
    )
  end
end
