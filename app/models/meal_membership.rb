class MealMembership < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :meal
end
