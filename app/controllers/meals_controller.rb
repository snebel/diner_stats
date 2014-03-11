class MealsController < ApplicationController
  def create
    meal = Meal.create(meal_params)
    meal.update(
      menu_id: Restaurant.find(params[:restaurant_id]).menus.last.id,
      duration: 0,
      price: 0)
    render :json => meal
  end

  def update
    meal = Meal.find(params[:id])
    time = Time.now - meal.created_at
    meal.update(duration: time, price: params[:price])
    render :json => meal  
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @meals = meals_by_time(@restaurant, params[:time1], params[:time2])
    @diners = total_diners(@meals)
    @avg_duration = avg_duration(@meals)
    @revenue = revenue(@meals)
    @avg_price = (@revenue / @meals.count).round(2) unless @meals.count == 0
    @avg_customer_price = (@revenue / @diners).round(2) unless @diner == 0
    @menu = @restaurant.menus.last
    # binding.pry

    respond_to do |format|
      format.html
      format.json do
        render json: item_revenue_data(@meals.map{|m| m.menu_items}.flatten.uniq, @revenue)
      end
    end
  end

  def times
    binding.pry
  end

  private
  def meal_params
    params.permit(:table_id, :diners)
  end
end
