class MealsController < ApplicationController
  def create
    render json: Meal.create(meal_params)
  end

  def update
    meal = Meal.find(params[:id])
    time = Time.now - meal.created_at
    meal.update(duration: time, price: params[:price])
    render :json => meal  
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    validate_times(params)

    @meals = meals_by_time(@restaurant.meals, params[:time1], params[:time2])
    @diners = total_diners(@meals)
    @avg_duration = avg_duration(@meals)
    @revenue = revenue(@meals)
    @avg_price = (@revenue / @meals.count).round(2) unless @meals.count == 0
    @avg_customer_price = (@revenue / @diners).round(2) unless @diners == 0
    @menu = @restaurant.menus.last
    @timeframe = params[:time1] ? "#{params[:time1]} - #{params[:time2]}" : "all time" 

    respond_to do |format|
      format.html
      format.json do
        render json: item_revenue_data(@meals, @revenue)
      end
    end
  end

  private
  def meal_params
    params.permit(:table_id, :diners, :menu_id)
  end
end
