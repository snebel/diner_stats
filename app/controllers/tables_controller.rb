class TablesController < ApplicationController
  def create
    Table.create(table_params)
    redirect_to restaurant_path(params[:restaurant_id])
  end

  def manage
    @restaurant = Restaurant.find(params[:restaurant_id])
    @tables = @restaurant.tables
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @tables = @restaurant.tables
  end

  private
  def table_params
    params.permit(:max_seats, :restaurant_id)
  end
end
