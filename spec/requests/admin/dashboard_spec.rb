# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Admin Dashboard" do
  it "should not allow homeowners to acces the admin area" do
    login_as create(:homeowner)

    expect(get(admin_dashboard_path)).to redirect_to(homeowner_dashboard_path)
  end
end
