class MealMembershipsController < ApplicationController
  def create
    meal_id = params[:meal_id]
    params[:menu_item_ids].map {|id| MealMembership.create(meal_id: meal_id, menu_item_id: id)}
    price = params[:menu_item_ids].inject(0) {|sum, id| sum += MenuItem.find(id).price}
    render json: price
  end

  private
  def meal_membership_params
    params.permit(:meal_id, :menu_item_id)
  end
end
