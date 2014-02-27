FactoryGirl.define do
  factory :menu do
    association :restaurant
    name "Dinner Menu"
  end
end
