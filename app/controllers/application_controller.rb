class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do | exception|
    redirect_to root_url, alert: exception.messages
  end
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password) }
  end
end
