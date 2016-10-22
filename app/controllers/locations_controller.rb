class LocationsController < ApplicationController
  def index
    @search = Location.search(params[:q])
    @locations = @search.result
  end

  def show
    @location = Location.find_by_id params[:id]
    @review = Review.new
    @comment = Comment.new
  end
end
