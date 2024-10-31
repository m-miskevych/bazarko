class Admin::CategoriesController < ApplicationController
  # http_basic_authenticate_with name: "admin", password: "1234"
  before_action :authenticate_user!

  layout "admin"
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_attributes

    if @category.save
      redirect_to admin_category_url(@category)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update category_attributes
      redirect_to admin_category_url(@category)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_url
  end

  private def category_attributes
    params.require(:category).permit(:name)
  end
end
