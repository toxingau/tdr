class ReviewsController < ApplicationController
  load_and_authorize_resource only: [:create, :destroy]

  def create
    @review = current_user.reviews.build review_params
    @location = @review.location
    @comment = Comment.new
    if @review.save
      update_rate @location if @review.rate.present?
      flash[:success] = t :success
      redirect_to @review.location
    else
      flash[:alert] = t :error
      redirect_to :back
    end
  end

  def destroy
    @review = current_user.reviews.find_by_id params[:id]
    @location = @review.location
    @review.destroy
    update_rate @location if @review.rate.present?
    flash[:danger] = t :destroyed
    redirect_to root_url
  end

  private
  def review_params
    params.require(:review).permit :content, :location_id, :rate
  end

  def update_rate location
    rating = location.reviews.where.not(rate: nil).average(:rate)
    location.update_attributes rating: rating    
  end
end
