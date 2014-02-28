class SectionsController < ApplicationController
  def create
  
    @section = Section.create(name: params[:name], menu_id: params[:menu_id])

    render :json => @section


    # respond_to do |format|
    #   format.json do
    #     section = Section.create(name: params[:name], menu_id: params[:menu_id])
    #   end
    # end
    # redirect_to edit_restaurant_menu_path(params[:restaurant_id], params[:menu_id])
  end  

  
end
