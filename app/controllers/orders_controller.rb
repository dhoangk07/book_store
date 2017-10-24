class OrdersController < ApplicationController
  def index
  	@orders = Order.all
    @order = Order.new
  end
  
  def show
  	# @order = order.find(params[:id])
    @order = Order.find_by(id: params[:id])

  end

  def new
  	@order = Order.new
  end

  def create
  	# params
  	@order = Order.new(order_params)
  	if @order.save
  		redirect_to orders_path
  	else
  		render :new
  	end
  end

  def edit
  	@order = Order.find(params[:id])
  end
 
  def update
  	@order = Order.find(params[:id])
  	if @order.update_attributes(order_params)
  		redirect_to order_path(@order)
  	else
  		render :edit
  	end
  end

  def order_params
  	params.require(:order).permit(:quantity, :book, :book_id, :customer, :customer_id, :total_price)
  end
end
