FactoryGirl.define do
  factory :division do
    developer
    email { Faker::Internet.email }
    division_name { Faker::Company.name }
    address { Faker::Address.street_name }
    city { Faker::Address.city }
    postcode { Faker::Address.postcode }
    contact_number { "+44 #{Faker::Number.number(9)}" }
  end
end
