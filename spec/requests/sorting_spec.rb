# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Sorting", type: :feature do
  it "provides sortable headers" do
    login_as create(:admin)

    create(:sample, name: "Alpha")
    create(:sample, name: "Beta")
    create(:sample, name: "Gamma")
    visit "/samples"

    expect(page).to have_link(I18n.t("activerecord.attributes.sample.name"))

    first_row_content = first(".list-item").text
    last_row_content = all(".list-item").last.text

    expect(first_row_content).to have_content("Alpha")
    expect(last_row_content).to have_content("Gamma")

    click_on(I18n.t("activerecord.attributes.sample.name"))

    post_sort_first_row_content = first(".list-item").text
    post_sort_last_row_content = all(".list-item").last.text

    expect(post_sort_first_row_content).to have_content("Gamma")
    expect(post_sort_last_row_content).to have_content("Alpha")
  end
end
