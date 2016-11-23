# frozen_string_literal: true
Given(/^I am logged in as an admin$/) do
  login_as create(:cf_admin)
end

When(/^I visit the Hoozzi site$/) do
  visit("/")
end

Then(/^I should be on the admin dashboard$/) do
  expect(page).to have_content("Dashboard")
end
