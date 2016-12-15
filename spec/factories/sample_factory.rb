# frozen_string_literal: true
FactoryGirl.define do
  factory :sample do
    name { Faker::Company.name }
    # contact_number { "+44 #{Faker::Number.number(9)}" }
  end
end
