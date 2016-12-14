# frozen_string_literal: true
module User
  class DashboardController < User::BaseController
    skip_authorization_check

    def show
    end
  end
end
