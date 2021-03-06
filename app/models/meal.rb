class Meal < ActiveRecord::Base
  has_many :meal_memberships
  has_many :menu_items, through: :meal_memberships
  belongs_to :menu
  belongs_to :table
end
