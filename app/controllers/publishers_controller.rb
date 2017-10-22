class PublishersController < ApplicationController
  def index
  	@publishers = Publisher.all
    @publisher = Publisher.new
  end
  
  def show
  	# @publisher = Publisher.find(params[:id])
    @publisher = Publisher.find_by(id: params[:id])

  end

  def new
  	@publisher = Publisher.new
  end

  def create
  	# params
  	@publisher = Publisher.new(publisher_params)
  	if @publisher.save
  		redirect_to publishers_path
  	else
  		render :new
  	end
  end

  def edit
  	@publisher = Publisher.find(params[:id])
  end
 
  def update
  	@publisher = Publisher.find(params[:id])
  	if @publisher.update_attributes(publisher_params)
  		redirect_to publisher_path(@publisher)
  	else
  		render :edit
  	end
  end

  def publisher_params
  	params.require(:publisher).permit(:name, :address, :publisher_id)
  end
end
