class DashboardsController < ApplicationController
	def index
  	 # @dashboards = Dashboard.all
  	  @books = Book.all
  	  @publishers = Publisher.all
  	  @customers = Customer.all
  	  @editors = Editor.all

  	end

  	def show
    @dashboard = Dashboard.find_by(id: params[:id])
	end

	def dashboard_params
  	params.require(:book).permit(:author, :title, :description, :publisher_id, :category_id, :price, :quantity)
  end

end