class CategoriesController < ApplicationController
    load_and_authorize_resource

  def show
    @locations = @category.locations.order(created_at: :desc).paginate page: params[:page]
  end
end
