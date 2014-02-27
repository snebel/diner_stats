FactoryGirl.define do
  factory :meal do
    association :menu
    association :table
  end
end