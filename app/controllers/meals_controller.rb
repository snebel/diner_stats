class MealsController < ApplicationController
  def create
    meal = Meal.create(meal_params)
    render :json => meal
  end

  def update
    # binding.pry
    meal = Meal.find(params[:id])
    meal.update(duration: Time.now - meal.created_at)
    render :json => meal  
  end

  private
  def meal_params
    params.permit(:table_id, :diners)
  end
end
