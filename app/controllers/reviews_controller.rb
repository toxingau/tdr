class ReviewsController < ApplicationController
  load_and_authorize_resource only: [:create, :destroy]

  def create
    @review = current_user.reviews.build review_params
    @location = @review.location
    @comment = Comment.new
    if @review.save
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
    flash[:danger] = t :destroyed
    redirect_to @review.location
  end

  private
  def review_params
    params.require(:review).permit :content, :location_id
  end
end
