class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @activities = PublicActivity::Activity.order(created_at: :desc)
      .where(owner_id: @user.id, owner_type: "User")
      .page(params[:page]).per_page(10)
  end
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    render 'show_follow'
  end
end
