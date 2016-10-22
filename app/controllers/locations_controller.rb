class LocationsController < ApplicationController
  load_and_authorize_resource

  def index
    @search = Location.search(params[:q])
    @locations = @search.result
    @search.build_condition
  end

  def show
    @location = Location.find_by_id params[:id]
    @review = Review.new
    @comment = Comment.new
  end
end
