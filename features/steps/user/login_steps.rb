# frozen_string_literal: true
Given(/^I am a user$/) do
  UserFixture.create
end

Given(/^I am logged in as a user$/) do
  guest = UserFixture.create
  login_as guest
end

When(/^I log in as a user$/) do
  guest = UserFixture

  visit "/"
  click_on "Login"

  fill_in "Email Address", with: guest.email
  fill_in "Password", with: guest.password
  click_on "Login"
end

Then(/^I should be on the user dashboard$/) do
  guest = UserFixture
  expect(page).to have_content "Hi #{guest.first_name}"
end
