# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    role { :owner }

    factory :cf_admin do
      role { :cf_admin }
    end

    factory :client_admin do
      role { :client_admin }
    end

    factory :client_user do
      role { :client_user }
    end

    factory :home_owner do
      role { :owner }
    end
  end
end
