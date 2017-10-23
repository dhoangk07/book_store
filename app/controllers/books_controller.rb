class BooksController < ApplicationController
  def index
  	@books = Book.all.order('view_count DESC')
  end

  # action
  def show
  	@book = Book.find(params[:id])
  	@comment = @book.comments.new
    # iincrease view count
    @book.increase_view_count
    @quantity

  end
 
  # action
  def new
  	@book = Book.new
  end

  def create
  	# params
  	@book = Book.new(book_params)
  	if @book.save
  		redirect_to books_path
  	else
  		render :new
  	end
 
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update_attributes(book_params)
  		redirect_to book_path(@book)
  	else
  		render :edit
  	end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
  end


  private

  def book_params
  	params.require(:book).permit(:author, :title, :description, :publisher_id, :price, :quantity)
  end
end
