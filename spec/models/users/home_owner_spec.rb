# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Home Owner" do
  include_examples "it cannot be assigned to developer or division" do
    let(:role) { :home_owner }
  end
end
