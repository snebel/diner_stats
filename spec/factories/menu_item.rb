FactoryGirl.define do
  factory :menu_item do
    association :section
    name "food"
    price 1.99
  end
end