class EditorsController < ApplicationController
  before_action :find_editor, only: %i[show update edit destroy]
	def index
	  @editors = Editor.all
	end

  def show
    @review = @editor.reviews.new
	end

  def new
	 @editor = Editor.new
	end

	def create
  	@editor = Editor.new(editor_params)
  	if @editor.save
      flash[:success] = "You've already successfully created #{@editor.name}"
  		redirect_to editors_path
  	else
  		render :new
  	end
  end
  
	def edit
	end

	def update
  	if @editor.update_attributes(editor_params)
      flash[:success] = "You've already successfully updated #{@editor.name}"
  		redirect_to editor_path(@editor)
  	else
  		render :edit
  	end
  end

  def destroy
    @editor.destroy
    flash[:danger] = "You've already successfully deleted #{@editor.name}"
    redirect_to editors_path
  end

  private
    def find_editor
      @editor = Editor.find(params[:id])
    end
    
  	def editor_params
  	  params.require(:editor).permit(:name, :phone, :birth_year)
  	end
end