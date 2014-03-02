class MealsController < ApplicationController
  def create
    meal = Meal.create(meal_params)
    meal.update(menu_id: Restaurant.find(params[:restaurant_id]).menus.last.id)
    render :json => meal
  end

  def update
    meal = Meal.find(params[:id])
    time = Time.now - meal.created_at
    meal.update(duration: time, price: params[:price])
    render :json => meal  
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @meals = @restaurant.meals
    @diners = @restaurant.total_diners
    @avg_duration = @restaurant.avg_duration
    @revenue = @restaurant.revenue
    @avg_price = (@revenue / @meals.count).round(2)
    @avg_customer_price = (@revenue / @diners).round(2) #@restaurant.avg_customer_price
  end

  private
  def meal_params
    params.permit(:table_id, :diners)
  end
end
