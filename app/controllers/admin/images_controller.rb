class Admin::ImagesController < ApplicationController
  load_and_authorize_resource

  def new
    @image = Image.new
  end

  def create
    @image = Image.new image_params
    if @image.save
      flash[:success] = t :success
      redirect_to admin_locations_path
    else
      flash[:danger] = t :failure
      render :new
    end
  end

  private
  def image_params
    params.require(:image).permit :img, :location_id
  end
end
