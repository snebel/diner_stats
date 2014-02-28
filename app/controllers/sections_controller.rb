class SectionsController < ApplicationController
  def create
    @section = Section.create(name: params[:name], menu_id: params[:menu_id])
    render :json => @section
  end 

  def destroy
    Section.delete(params[:id])
    render json: "deleted", :status => :ok
  end

  def edit
    @section = Section.find(params[:id])  
  end
  
end
