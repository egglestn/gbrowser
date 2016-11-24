FactoryGirl.define do
  factory :developer do
    email { Faker::Internet.email }
    company_name { Faker::Company.name }
    head_office_address { Faker::Address.street_name }
    city { Faker::Address.city }
    postcode { Faker::Address.postcode }
    contact_number { "+44 #{Faker::Number.number(9)}" }
  end
end
