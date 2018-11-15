class LocationsController < ApplicationController
  before_action :find_location, only: %i[show edit update destroy]
	def index
	  @locations = Location.all
	end

	def show
	end

  def new
	 @location = Location.new
	end

	def create
	@location = Location.new(location_params)
  	if @location.save
  		redirect_to locations_path
  	else
  		render :new
  	end
  end
  
	def edit
	end
  
	def destroy
	  @location.destroy
	  redirect_to locations_path
	end
 
	def update
  	if @location.update_attributes(location_params)
  		redirect_to location_path(@location)
  	else
  		render :edit
  	end
  end

  private

  def find_location
    @location = Location.find(params[:id])
  end

	def location_params
	  params.require(:location).permit(:name, :street, :address, :district)
	end
 end