class CommentsController < ApplicationController
  load_and_authorize_resource only: [:create, :destroy]

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      flash[:success] = t :success
      redirect_to @comment.review.location
    else
      flash[:alert] = t :error
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find_by_id params[:id]
    @comment.destroy
    flash[:danger] = t :destroyed
    redirect_to @comment.review.location
  end

  private
  def comment_params
    params.require(:comment).permit :content, :review_id
  end
end
