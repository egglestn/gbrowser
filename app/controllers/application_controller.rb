class ApplicationController < ActionController::Base
  http_basic_authenticate_with(
    name: Rails.application.secrets.login_name,
    password: Rails.application.secrets.login_password
  )

  protect_from_forgery with: :exception
end
