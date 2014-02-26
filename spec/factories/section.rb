FactoryGirl.define do
  factory :section do
    association :menu
    name "Appetizers"
  end
end