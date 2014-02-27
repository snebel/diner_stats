class Restaurant < ActiveRecord::Base
  has_many :tables
  has_many :menus
  has_many :meals, through: :tables
end
