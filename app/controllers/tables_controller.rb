class TablesController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    Table.create(table_params)
    redirect_to restaurant_tables_manage_path(params[:restaurant_id])
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @tables = @restaurant.tables
    @meals = meals_by_time(@restaurant.meals, params[:time1], params[:time2])
    revenue = revenue(@meals)
    respond_to do |format|
      format.html
      format.json do
        render json: table_revenue_data(@meals, @tables, revenue)
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

  def destroy
    Table.delete(params[:id])
    Meal.where(table_id: params[:id]).delete_all
    redirect_to restaurant_path(params[:restaurant_id])
  end

  private
  def table_params
    params.permit(:max_seats, :restaurant_id, :number)
  end
end
