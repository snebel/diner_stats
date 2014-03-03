class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def avg_duration(meals)
  	total_minutes = meals.map{|meal| meal.duration / 60.0}.reduce(:+)
  	(total_minutes.to_f / meals.count).round(1)
  end

  def revenue(meals)
  	meals.inject(0) {|sum, meal| sum += meal.price}.round(2)
  end

  def avg_price(meals)
  	(revenue(meals) / meals.count).round(2)
  end	

  def total_diners(meals)
    return 0 if meals.empty?
  	meals.map{|meal| meal.diners}.reduce(:+)
  end

  def avg_customer_price(meals)
  	(revenue(meals) / total_diners(meals)).round(2)
  end



end
