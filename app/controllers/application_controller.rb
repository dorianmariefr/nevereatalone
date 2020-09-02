class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    return unless session[:user_id].present?

    @current_user ||= User.find_by(id: session[:user_id])
  end
end
