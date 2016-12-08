# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Homeowner" do
  include_examples "it cannot be assigned to developer or division" do
    let(:role) { :homeowner }
  end
end
