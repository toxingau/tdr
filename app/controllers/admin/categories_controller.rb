class Admin::CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :destroy]

  def index
    @categories = Category.paginate page: params[:page]
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t :success
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end

  def find_category
    @category = Category.find_by_id params[:id]
    if @category.nil?
      flash[:danger] = t :category_fails
      redirect_to admin_categories_path
    end
  end
end
