# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :table do
    #association :restaurant
    max_seats 4
  end
end
