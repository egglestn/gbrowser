# frozen_string_literal: true
require "rails_helper"

RSpec.describe UnitType do
  it "cannot assign a phase from a different development" do
    phase = create :phase, development: create(:development)
    unit_type = build :unit_type, development: create(:development)

    unit_type.phases << phase
    unit_type.validate

    expect(unit_type.errors.full_messages)
      .to include("Phases must be from the development the unit type is for")
  end

  it "can assign a phase from the same development" do
    development = create(:development)
    phase = create :phase, development: development
    unit_type = build :unit_type, development: development

    unit_type.phases << phase

    expect(unit_type).to be_valid
  end
end
