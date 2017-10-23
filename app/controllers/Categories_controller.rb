class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
    @category = Category.new
  end
  
  def show
  	# @category = category.find(params[:id])
    @category = Category.find_by(id: params[:id])

  end

  def new
  	@category = Category.new
  end

  def create
    # params
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end
 
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def category_params
    params.require(:category).permit(:name, :category_id)
  end
end