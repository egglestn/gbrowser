class ApplicationController < ActionController::Base
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

  def current_user
    User.new(first_name: 'Guest', last_name: 'Guest')
  end
end
