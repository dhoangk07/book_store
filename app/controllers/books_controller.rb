class BooksController < ApplicationController
  before_action :find_book, only: %i[show edit update destroy]
  def index
    if params[:order] == 'name'
      @books = Book.order('title ASC')
    elsif params[:order] == 'id' # ordered by views_count
      @books = Book.order('id ASC')
    else
      @books = Book.order('view_count DESC')
    end
  end

  def show
  	@comment = @book.comments.new
    # iincrease view count
    @book.increase_view_count
  end
 
  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
      flash[:success] = "You've already successfully created #{@book.title}"
  		redirect_to books_path
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @book.update_attributes(book_params)
      flash[:success] = "You've already successfully updated #{@book.title}"
  		redirect_to book_path(@book)
  	else
  		render :edit
  	end
  end

  def destroy
  	@book.destroy
    flash[:danger] = "You've already successfully deleted #{@book.title}"
  	redirect_to books_path
  end


  private
  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
  	params.require(:book).permit(:author, :title, :description, :publisher_id, :category_id, :price, :quantity)
  end
end
