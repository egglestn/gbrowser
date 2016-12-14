# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    role { :user }

    factory :admin do
      role { :admin }
    end

    factory :user do
      role { :user }
    end
  end
end
