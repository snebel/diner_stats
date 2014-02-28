class SectionsController < ApplicationController
  def create
    @section = Section.create(name: params[:name], menu_id: params[:menu_id])
    render :json => @section
  end 

  def destroy
    Section.delete(params[:id])
    # respond_to do |format|
    #   format.json { :success => true }.as_json
    # end
    render json: "deleted", :status => :ok
  end
  
end
