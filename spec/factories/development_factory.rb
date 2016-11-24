FactoryGirl.define do
  factory :development do
    development_name {  "#{Faker::Company.name} Develoment" }
    office_address { Faker::Address.street_name }
    city { Faker::Address.city }
    postcode { Faker::Address.postcode }
    email { Faker::Internet.email }
    contact_number { "+44 #{Faker::Number.number(9)}" }
    developer
  end
end
