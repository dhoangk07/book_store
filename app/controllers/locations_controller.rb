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
      flash[:success] = "You've already successfully created #{@location.name}"
  		redirect_to locations_path
  	else
  		render :new
  	end
  end
  
	def edit
	end
  
	def update
  	if @location.update_attributes(location_params)
      flash[:success] = "You've already successfully updated #{@location.name}"
  		redirect_to location_path(@location)
  	else
  		render :edit
  	end
  end
  
  def destroy
    @location.destroy
    flash[:danger] = "You've already successfully deleted #{@location.name}"
    redirect_to locations_path
  end

  private
    def find_location
      @location = Location.find(params[:id])
    end

  	def location_params
  	  params.require(:location).permit(:name, :street, :address, :district)
  	end
 end