class CommentsController < ApplicationController
  def create
  	# params
  	@comment = Comment.new(comment_params)
  	if @comment.save
      flash[:success] = "You've already successfully created comment"
  		redirect_to book_path(@comment.book)
  	end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:danger] = "You've already successfully deleted comment"
    redirect_to book_path(@comment.book)
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :book_id)
    end
end
