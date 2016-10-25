class ReviewsController < ApplicationController
  load_and_authorize_resource

  def create
    @review = current_user.reviews.build review_params
    if @review.save
      redirect_to @review.location
    else
      flash[:alert] = t :error
      redirect_to :back
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    @review.update_attributes review_params
    respond_to do |format|
      format.html {redirect_to @review.location}
      format.js
    end
  end

  def destroy
    @review.destroy
    flash[:danger] = t :destroyed
    redirect_to @review.location
  end

  private
  def review_params
    params.require(:review).permit :content, :location_id
  end
end
