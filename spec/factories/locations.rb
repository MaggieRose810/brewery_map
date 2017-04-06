FactoryGirl.define do
  factory :location do
    sequence(:ext_id)
    brewery
  end
end