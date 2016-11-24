# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Client User" do
  it "is not valid without a developer or division assigned" do
    client_user = build(:client_user, developer: nil, division: nil)

    client_user.validate

    expect(client_user.errors.full_messages)
      .to include("Role must have a Developer or Division for a Client User.")
  end

  it "is valid with a developer assigned" do
    client_user = build(:client_user, developer: create(:developer), division: nil)

    expect(client_user).to be_valid
  end

  it "is valid with a division assigned" do
    client_user = build(:client_user, developer: nil, division: create(:division))

    expect(client_user).to be_valid
  end
end
