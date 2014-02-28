class MenuItemsController < ApplicationController
  def create
    MenuItem.create(item_params)
    section = Section.find(params[:section_id])
    redirect_to edit_menu_section_path(section.menu_id, section.id)
  end

  private
  def item_params
    params.permit(:name, :price, :section_id)
  end
end
