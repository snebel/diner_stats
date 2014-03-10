class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @tables = @restaurant.tables
  end

  def root # for demonstration purposes
    redirect_to restaurant_path(1)
  end
end
