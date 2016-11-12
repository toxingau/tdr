class ReviewsController < ApplicationController
  load_and_authorize_resource

  def create
    @review = current_user.reviews.build review_params
    if @review.save
      location = @review.location
      location.rate_avg = location.reviews.average(:rating)
      location.save
      flash[:success] = t "review.create_success"
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
    if @review.update_attributes review_params
      flash[:success] = t "review.update_success"
      redirect_to @review.location
      location = @review.location
      location.rate_avg = location.reviews.average(:rating).round(2)
      location.save
    end
  end

  def destroy
    @review.destroy
    flash[:danger] = t :destroyed
    redirect_to @review.location
  end

  private
  def review_params
    params.require(:review).permit :user_id, :content, :location_id,
      :rating
  end
end
