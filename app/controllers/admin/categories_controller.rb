class Admin::CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :destroy, :edit, :update]

  def index
    @search = Category.search(params[:q])
    @categories = @search.result.page params[:page]
  end

  def show
    @search = @category.locations.search params[:q]
    @locations = @search.result.page params[:page ]
  end

  def edit
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

  def update
    if @category.update category_params
      flash[:success] = t "categories.update"
    else
      flash[:danger] = t "flash.fail"
    end
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
