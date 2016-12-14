# frozen_string_literal: true
Given(/^I am a user$/) do
  UserFixture.create
end

Given(/^I am logged in as a user$/) do
  login_as UserFixture.create
  visit "/"
end

When(/^I log in as a user$/) do
  user = UserFixture

  visit "/"
  click_on "Login"

  fill_in "Email Address", with: user.email
  fill_in "Password", with: user.password
  click_on "Login"
end

When(/^I log out as a user$/) do
  click_on "Log out"
end

Then(/^I should be on the "My Home" dashboard$/) do
  user = UserFixture

  expect(page).to have_content "Hi #{user.first_name}"
  pending
end

Then(/^I should be on the user home page$/) do
  expect(current_path).to eq("/")
end
