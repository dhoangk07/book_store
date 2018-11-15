class OrdersController < ApplicationController
  before_action :find_order, only: %i[show edit update destroy]
  def index
  	@orders = Order.all
  end
  
  def show
  end

  def new
  	@order = Order.new
  end

  def create
  	@order = Order.new(order_params)
  	if @order.save
  		redirect_to orders_path
  	else
  		render :new
  	end
  end

  def edit
  end
 
  def update
  	if @order.update_attributes(order_params)
  		redirect_to order_path(@order)
  	else
  		render :edit
  	end
  end

  private
  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
  	params.require(:order).permit(:quantity, :book, :book_id, :customer, :customer_id, :total_price)
  end
end
