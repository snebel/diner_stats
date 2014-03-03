class Restaurant < ActiveRecord::Base
  has_many :tables
  has_many :menus
  has_many :menu_items, through: :menus
  has_many :meals, through: :tables

  def total_diners
  	meals.map{|meal| meal.diners}.reduce(:+)
  end

  def avg_duration
  	total_minutes = meals.map{|meal| meal.duration / 60}.reduce(:+)
  	(total_minutes.to_f / meals.count).round(1)
  end

  def revenue
  	meals.inject(0) {|sum, meal| sum += meal.price}.round(2)
  end

  def avg_customer_price

  end
end
