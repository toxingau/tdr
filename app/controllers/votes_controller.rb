class VotesController < ApplicationController
  def create
    @review = Review.find_by_id params[:review_id]
    current_user.likes @review
    @review.create_activity :like
    respond_to do |format|
      format.js
      format.html {redirect_to @review.location}
    end
  end

  def destroy
    @review = Review.find_by_id params[:id]
    current_user.dislikes @review
    @review.create_activity :dislike
    respond_to do |format|
      format.js
      format.html {redirect_to @review.location}
    end
  end
end
