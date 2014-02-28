class MenusController < ApplicationController

  def create
    menu = Menu.create(menu_params)
    redirect_to restaurant_path(params[:restaurant_id])
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:id])
  end

private
  def menu_params
    params.permit(:name, :restaurant_id)
  end
end

