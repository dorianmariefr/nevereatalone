class PagesController < ApplicationController
  skip_authorization_check

  def home
    if current_user
      redirect_to availabilities_path
    end
  end

  def privacy
  end

  def terms
  end
end
