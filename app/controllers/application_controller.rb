class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :image, :email, :password, :password_confirmation, :role)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:first_name, :last_name, :image, :email, :password, :password_confirmation, :current_password, :role)}
  end
end