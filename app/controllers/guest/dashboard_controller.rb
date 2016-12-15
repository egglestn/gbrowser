# frozen_string_literal: true
module Guest
  class DashboardController < Guest::BaseController
    skip_authorization_check

    def show
    end
  end
end
