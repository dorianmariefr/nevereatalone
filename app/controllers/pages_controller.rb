class PagesController < ApplicationController
  skip_authorization_check

  def home
    if current_user
      @current_user_availabilities = current_user.availabilities
      @other_users_availabilities = Availability.where.not(user: current_user)
      @availability = Availability.new(user: current_user)
    end
  end

  def privacy
  end

  def terms
  end
end
