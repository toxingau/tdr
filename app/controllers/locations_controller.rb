class LocationsController < ApplicationController
  load_and_authorize_resource

  def index
    @search = Location.search(params[:q])
    @locations = @search.result.page(params[:page]).per_page(6)
    @categories = Category.all
  end

  def show
    @location = Location.find_by_id params[:id]
    @review = Review.new
    @reviews = @location.reviews.all.page(params[:page]).per_page(1)
    @comment = Comment.new
  end
end
