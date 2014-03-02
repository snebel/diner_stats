class MealsController < ApplicationController
  def create
    meal = Meal.create(meal_params)
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
  end

  private
  def meal_params
    params.permit(:table_id, :diners)
  end
end
