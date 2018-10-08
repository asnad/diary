FactoryGirl.define do
  factory :batch do
    trait :invalid_batch do
    end
    
    trait :valid_batch do
      start_date Date.today
      end_date Date.today + 1.year
      standard '1'
    end
  end

  
end
