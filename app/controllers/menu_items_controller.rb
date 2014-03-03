class MenuItemsController < ApplicationController
  def create
    MenuItem.create(item_params)
    section = Section.find(params[:section_id])
    redirect_to edit_menu_section_path(section.menu_id, section.id)
  end

  def destroy
    item = MenuItem.find(params[:id])
    section = Section.find(item.section_id)
    item.delete
    redirect_to edit_menu_section_path(section.menu_id, section.id)
  end

  def show
    @item = MenuItem.find(params[:id])
    @meals = @item.meals.uniq
    @table_percent = @item.table_percent
    @item_percent = @item.item_percent
    item_revenue = @item.item_revenue
    @rev_share = (item_revenue / revenue(@item.section.menu.meals) * 100).round(2)
  end

  private
  def item_params
    params.permit(:name, :price, :section_id)
  end
end
