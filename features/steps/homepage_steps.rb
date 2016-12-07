# frozen_string_literal: true
When(/^I visit the hoozzi site$/) do
  visit "/"
end

Then(/^I should be on the hoozzi homepage$/) do
  expect(page).to have_content("Home")
  expect(page).to have_link("Home")
  expect(page).not_to have_link("Dashboard")
end
