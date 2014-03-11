class SectionsController < ApplicationController
  def create
    @section = Section.create(name: params[:name], menu_id: params[:menu_id])
    render :json => @section
  end 

  def destroy
    Section.delete(params[:id])
    MenuItem.where(section_id: params[:id]).delete_all
    render json: "deleted", :status => :ok
  end

  def edit
    @section = Section.find(params[:id])  
    @menu = Menu.find(params[:menu_id])
  end

  def index
    menu = Menu.find(params[:menu_id])
    sections = menu.sections
    meals = meals_by_time(menu.meals, params[:time1], params[:time2])
    revenue = revenue(meals)
    render json: sections_revenue_data(meals, sections, revenue)
  end
  
end
