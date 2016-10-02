class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update]
  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Update success"
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :email
  end

  def find_user
    @user = User.find_by_id params[:id]
    if @user.nil?
      redirect_to root_path
      flash[:danger] = t :user_fails
    end
  end
end
