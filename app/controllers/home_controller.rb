# frozen_string_literal: true
class HomeController < ApplicationController
  layout "home"
  skip_before_action :authenticate_user!
  skip_authorization_check

  def show
    redirect_to(guest_dashboard_path) && return if current_user&.guest?
    redirect_to(admin_dashboard_path) && return if current_user
  end
end
