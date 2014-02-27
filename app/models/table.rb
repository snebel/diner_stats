class Table < ActiveRecord::Base
  belongs_to :restaurant
  has_many :meals
  # has_many :features
end
