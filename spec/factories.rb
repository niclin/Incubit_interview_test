FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { "a00000000" }
    password_confirmation { "a00000000" }
  end
end
