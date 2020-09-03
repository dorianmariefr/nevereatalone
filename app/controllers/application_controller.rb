class ApplicationController < ActionController::Base
  helper_method :current_user

  check_authorization

  rescue_from CanCan::AccessDenied do
    redirect_to root_path, alert: "Tu ne peux pas faire ça"
  end

  private

  def current_user
    return unless session[:user_id].present?

    @current_user ||= User.find_by(id: session[:user_id])
  end
end
