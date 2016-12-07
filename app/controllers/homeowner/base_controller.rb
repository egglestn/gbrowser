# frozen_string_literal: true
module Homeowner
  class BaseController < ApplicationController
    skip_before_action :redirect_homeowners
    layout "homeowner"
  end
end
