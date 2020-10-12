class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name profile_image])
    devise_parameter_sanitizer.permit(:edit, keys: %i[name profile_image])
    devise_parameter_sanitizer.permit(:update, keys: %i[name profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name profile_image])
  end
end
