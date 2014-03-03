class Table < ActiveRecord::Base
  belongs_to :restaurant
  has_many :meals
  # has_many :features
  
  def total_price
  	meals.inject(0) {|sum, meal| sum += meal.price}
  end

  def total_diners
  	meals.inject(0) {|sum, meal| sum += meal.diners}
  end

  def avg_price
  	return 0 if meals.count == 0
  	(total_price / meals.count).round(2)
  end

  def avg_customer_price
    return 0 if total_diners == 0
  	(total_price / total_diners).round(2)
  end

  def avg_meal_time
  	total_time = meals.inject(0) {|sum, meal| sum += meal.duration/60.0}
  	return 0 if total_time == 0
    (total_time / meals.count).round(1)
  end

  def avg_seats
  	(total_diners.to_f / meals.count).round(2)
  end

end
