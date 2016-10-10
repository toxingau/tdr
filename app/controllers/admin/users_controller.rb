class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def destroy
    if @user.destroy
      flash[:success] = "Delete Success"
    else
      flash[:danger] = "Delete Fail"
    end
    redirect_to admin_users_path
  end
end
