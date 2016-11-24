# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Client Admin" do
  include_examples "it cannot be assigned to developer or division" do
    let(:role) { :client_admin }
  end
end
