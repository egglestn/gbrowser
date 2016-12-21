# frozen_string_literal: true
# require "rails_helper"

RSpec.describe "Navigation", type: :feature do
  it "only adds active link to the current page nav link" do
    login_as create(:admin)

    visit "/samples"

    within ".navbar-menu" do
      active_links = find_all ".active"

      expect(active_links.count).to eq(1)
      expect(active_links.first.text).to eq("Samples")
    end
  end

  it "displays nested breadcrumbs relative to the current page" do
    sample = create(:sample)

    login_as create(:admin)
    visit "/samples/#{sample.id}"

    within ".breadcrumb-container" do
      expect(page).to have_link("Dashboard", href: "/")
      expect(page).to have_link("Samples", href: "/samples")
      expect(page).to have_text(sample.name)
    end
  end
end
