# frozen_string_literal: true
module Guest
  class BaseController < ApplicationController
    skip_before_action :redirect_users
    layout "guest"
  end
end
