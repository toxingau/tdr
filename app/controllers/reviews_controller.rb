class ReviewsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def create
    @review = current_user.reviews.build review_params
    @location = Location.find_by_id @review.location_id
    if review.save
      repond_to do |format|
        format.html {redirect_to root_url}
        format.js
      end
    else
      flash[:alert] = t :error
      redirect_to :back
    end  
  end

  def destroy
    @review = current_user.reviews.find_by_id params[:id]
    @location = @review.location
    @review.destroy
    repond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
  end

  private
  def review_params
    params.require(:review).permit :content, :location_id
  end
end
