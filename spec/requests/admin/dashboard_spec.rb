# frozen_string_literal: true
# require "rails_helper"

RSpec.describe "Admin Dashboard" do
  it "should not allow users to acces the admin area" do
    login_as create(:user)

    expect(get(admin_dashboard_path)).to redirect_to(user_dashboard_path)
  end
end
