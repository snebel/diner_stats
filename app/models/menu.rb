class Menu < ActiveRecord::Base
  belongs_to :restaurant
  has_many :sections
  has_many :menu_items, through: :sections
  has_many :meals
  
end
