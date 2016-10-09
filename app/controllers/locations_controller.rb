class LocationsController < ApplicationController
  def index
    @locations = Location.order(rating: :desc).paginate page: params[:page]
  end

  def show
    @location = Location.find_by_id params[:id]
  end
end
