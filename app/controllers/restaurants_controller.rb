class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @menu = @restaurant.menus.last
  end
end
