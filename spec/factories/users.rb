FactoryGirl.define do
  factory :user do
    trait :invalid_teacher do
      user_type User.user_types[:teacher]
    end    
  end
end
