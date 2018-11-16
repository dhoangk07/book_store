class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show edit update destroy]
  def index
  	@categories = Category.all
  end
  
  def show
  end

  def new
  	@category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You've already successfully created #{@category.name}"
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
  end
 
  def update
    if @category.update_attributes(category_params)
      flash[:success] = "You've already successfully updated #{@category.name}"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "You've already successfully deleted #{@category.name}"
    redirect_to categories_path
  end

  private
  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :category_id)
  end
end