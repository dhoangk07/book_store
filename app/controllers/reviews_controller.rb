class ReviewsController < ApplicationController
  def create
  	# params
  	@review = Review.new(review_params)
  	if @review.save
  		redirect_to editor_path(@review.editor)
  	end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to editor_path(@review.editor)
  end

  private

  def review_params
    params.require(:review).permit(:content, :editor_id)
  end
end
