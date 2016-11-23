class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @search = User.search(params[:q])
    @users = @search.result.page(params[:page]).per_page(10)
    @activities = PublicActivity::Activity.all.order(created_at: :desc)
      .page(params[:page]).per_page(10)
  end

  def destroy
    if @user.destroy
      flash[:success] = "Delete Success"
    else
      flash[:danger] = "Delete Fail"
    end
    redirect_to admin_users_path
  end

  def show
    @activities = PublicActivity::Activity.order(created_at: :desc)
      .where(owner_id: @user.id, owner_type: "User")
  end
end
