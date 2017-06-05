class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
    
   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
  end

  protect_from_forgery with: :exception
end
