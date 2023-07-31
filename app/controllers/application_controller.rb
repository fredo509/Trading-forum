# frozen_string_literal: true

class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :authenticate_request
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username bio email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name username bio email password])
  end

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end
