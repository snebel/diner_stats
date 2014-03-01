class MealsController < ApplicationController
  def create
    meal = Meal.create(meal_params)
    render :json => meal
  end

  private
  def meal_params
    params.permit(:table_id, :diners)
  end
end
