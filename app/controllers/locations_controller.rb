class LocationsController < ApplicationController
	def index
  	  @locations = Location.all
  	end

  	def show
  	# @location = location.find(params[:id])
    @location = Location.find_by(id: params[:id])
    #@review = @location.reviews.new

	end

    def new
  	@location = Location.new
  	end

  	def create
  	# params
  	@location = Location.new(location_params)
  	if @location.save
  		redirect_to locations_path
  	else
  		render :new
  	end
 
  end
  
  	def edit
  	@location = Location.find(params[:id])
  	end
  
  	def destroy
  	  @location = Location.find(params[:id])
  	  @location.destroy
  	  redirect_to locations_path
  	end
 
  	def update
	  	@location = Location.find(params[:id])
	  	if @location.update_attributes(location_params)
	  		redirect_to location_path(@location)
	  	else
	  		render :edit
	  	end
    end

  	def location_params
  	  params.require(:location).permit(:name, :street, :address, :district)
  	end
 end