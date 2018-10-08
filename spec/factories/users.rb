FactoryGirl.define do
  factory :user do
    trait :invalid_user do
    end
    trait :valid_user do
      first_name Faker::Name.first_name
      last_name Faker::Name.last_name
      email Faker::Internet.email
      password 12345678
    end
  end
end
