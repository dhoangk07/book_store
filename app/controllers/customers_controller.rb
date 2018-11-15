class CustomersController < ApplicationController
  before_action :find_customer, only: %i[show update edit destroy]
  def index
  	@customers = Customer.all
  end

  def show
  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.new(customer_params)
  	if @customer.save
  		redirect_to customers_path
  	else
  		render :new
  	end
 
  end

  def edit
  end

  def update
  	if @customer.update_attributes(customer_params)
  		redirect_to customer_path(@customer)
  	else
  		render :edit
  	end
  end

  def destroy
  	@customer.destroy
  	redirect_to customers_path
  end

  private
  def find_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
  	params.require(:customer).permit(:name, :sex, :age,)
  end
end