# frozen_string_literal: true
When(/^I create a developer$/) do
  visit "/"
  click_on "Developers"
  click_on(I18n.t("developers.index.add"))
  fill_in "developer_company_name", with: "Test company name"
  click_on("Create Developer")
end

Then(/^I should see the created developer$/) do
  expect(page).to have_content("Test company name")
end

When(/^I update the developer$/) do
  click_on "Edit"
  fill_in "developer_postcode", with: "RG13 5HY"
  click_on("Update Developer")
end

Then(/^I should see the updated developer$/) do
  expect(page).to have_content("RG13 5HY")
end

When(/^I delete the developer$/) do
  click_on "Back"
  # Launches the confirmation dialog
  find("[name=delete]").trigger("click")
  # Click the "real" delete in the confirmation dialog
  find(".btn-delete").trigger("click")
end

Then(/^I should see the delete complete successfully$/) do
  expect(page).to have_content("Test company name was deleted successfully")
  within "table" do
    expect(page).to have_no_content("Test company name")
  end
end
