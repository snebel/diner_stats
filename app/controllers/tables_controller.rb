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
    revenue = revenue(@restaurant.meals)
    respond_to do |format|
      format.html
      format.json do
        render json: table_revenue_data(@tables, revenue)
      end
    end
  end

  def show
    @table = Table.find(params[:id])
    @meals = @table.meals
    @avg_seats = @table.avg_seats
    @avg_duration = avg_duration(@meals)
    @avg_price = avg_price(@meals)
    @avg_customer_price = avg_customer_price(@meals)
  end

  def seating
    table_data = params[:tables].values
    set_positions(table_data)
    render :json => {}
  end

  private
  def table_params
    params.permit(:max_seats, :restaurant_id, :number)
  end
end
