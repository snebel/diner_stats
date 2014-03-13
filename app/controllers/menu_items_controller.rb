class MenuItemsController < ApplicationController
  def create
    @item = MenuItem.create(item_params)
    render json: @item
  end

  def destroy
    item = MenuItem.find(params[:id])
    item.update(section_id: nil)
    render json: {}
  end

  def show
    @item = MenuItem.find(params[:id])
    @menu = @item.section.menu
    @meals = @item.meals.uniq
    @meal_percent = @item.meal_percent
    @item_percent = @item.item_percent
    item_revenue = @item.item_revenue
    @rev_share = (item_revenue / revenue(@item.section.menu.meals) * 100).round(2)
  end

  private
  def item_params
    params.permit(:name, :price, :section_id)
  end
end
