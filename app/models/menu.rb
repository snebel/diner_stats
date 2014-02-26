class Menu < ActiveRecord::Base
  has_many :sections
  has_many :menu_items, through: :sections
  # has_many :meals
  # belongs_to :restaurant
end
