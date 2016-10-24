class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
        redirect_to @comment.review
    else
      flash[:alert] = t :error
      redirect_to :back
    end
  end


  def destroy
    @comment.destroy
    flash[:danger] = t :destroyed
    redirect_to @comment.review
    end    
  end

  def edit
  end

  def update
    if @comment.update_attributes comment_params
      flash[:success] = t :commentupdated
    else
      render :edit
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :review_id
  end
end
