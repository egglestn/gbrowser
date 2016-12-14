# frozen_string_literal: true
module User
  class BaseController < ApplicationController
    skip_before_action :redirect_users
    layout "user"
  end
end
