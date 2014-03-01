class MealMembershipsController < ApplicationController
  def create
    # binding.pry
    item = MenuItem.find(params[:menu_item_id])
    MealMembership.create(meal_membership_params)
    render :json => item
  end

  private
  def meal_membership_params
    params.permit(:meal_id, :menu_item_id)
  end
end
