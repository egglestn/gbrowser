class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  check_authorization

  http_basic_authenticate_with(
    name: Rails.application.secrets.login_name,
    password: Rails.application.secrets.login_password
  )

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end
end
