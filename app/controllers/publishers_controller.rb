class PublishersController < ApplicationController
  before_action :find_publisher, only: %i[show edit update destroy]
  def index
  	@publishers = Publisher.all
  end
  
  def show
  end

  def new
  	@publisher = Publisher.new
  end

  def create
  	if @publisher.save
  		redirect_to publishers_path
  	else
  		render :new
  	end
  end

  def edit
  end
 
  def update
  	if @publisher.update_attributes(publisher_params)
  		redirect_to publisher_path(@publisher)
  	else
  		render :edit
  	end
  end

  def destroy
    @publisher.destroy
    redirect_to publishers_path
  end

  private
  def find_publisher
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params
  	params.require(:publisher).permit(:name, :address, :publisher_id)
  end
end
