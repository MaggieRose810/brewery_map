FactoryGirl.define do
  factory :crawl do
    name 'Gandalf'
    endpoint 'locations'

    trait :uncompleted do
      completed_at nil
    end

    trait :completed do
      completed_at Time.now
    end
  end
end
