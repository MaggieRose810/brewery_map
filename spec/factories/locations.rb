FactoryGirl.define do
  factory :location do
    sequence(:ext_id)
    brewery_ext_id 1
  end
end