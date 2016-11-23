# frozen_string_literal: true
require "rails_helper"

RSpec.describe "CF Admin" do
  include_examples "it cannot be assigned to developer or division" do
    let(:role) { :cf_admin }
  end
end
