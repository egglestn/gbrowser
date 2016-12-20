# frozen_string_literal: true
When(/^I visit the site$/) do
  visit "/"
end

Then(/^I should be on the guest homepage$/) do
  expect(page).to have_content("Home")
end
