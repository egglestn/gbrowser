# frozen_string_literal: true
require "rails_helper"

RSpec.describe "User" do
  include_examples "it cannot be assigned to admin stuff" do
    let(:role) { :user }
  end
end
