# frozen_string_literal: true
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :redirect_users, if: -> { current_user }
  check_authorization

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    referrer = request.referer
    url = if !referrer.blank? && referrer != request.url
            referrer
          else
            root_url
          end

    redirect_to url
  end

  private

  def redirect_users
    redirect_to(guest_dashboard_path) && return if current_user.guest?
  end
end
