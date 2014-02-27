class MenusController < ApplicationController
  
  def new
    # @menu = Menu.new(restaurant_id: params[:restaurant_id])
    @menu = Menu.new
    # binding.pry
  end

  def create
    menu = Menu.new(menu_params)
    menu.restaurant_id = params[:restaurant_id]
    menu.save
    restaurant = Restaurant.find(params[:restaurant_id])
    redirect_to edit_restaurant_menu_path(restaurant.id, menu.id)
  end

  def edit
    @menu = Menu.find(params[:id])
  end

private
  def menu_params
    params.require('menu').permit(:name)
  end
end

