class Restaurant < ActiveRecord::Base
  has_many :tables
  has_many :menus
  has_many :menu_items, through: :menus
  has_many :meals, through: :tables

  def total_diners
  	self.meals.map{|meal| meal.diners}.reduce(:+)
  end

  def avg_duration
  	meals = self.meals
  	total_minutes = meals.map{|meal| meal.duration / 60}.reduce(:+)
  	num_meals = meals.count
  	(total_minutes.to_f / num_meals).round(1)
  end

  def revenue
  	self.meals.inject(0) {|sum, meal| sum += meal.price}.round(2)
  end

  def avg_customer_price
  		
  end
end
