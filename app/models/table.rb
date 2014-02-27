class Table < ActiveRecord::Base
  has_many :meals
  # has_many :features
  # belongs_to :restaurant
end
