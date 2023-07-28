class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :bio, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :bio, :email, :password])
  end
end
