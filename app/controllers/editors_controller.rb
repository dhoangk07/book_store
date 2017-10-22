class EditorsController < ApplicationController
	def index
  	  @editors = Editor.all
  	end

  	def show
  	# @editor = editor.find(params[:id])
    @editor = Editor.find_by(id: params[:id])
    @review = @editor.reviews.new

	end

    def new
  	@editor = Editor.new
  	end

  	def create
  	# params
  	@editor = Editor.new(editor_params)
  	if @editor.save
  		redirect_to editors_path
  	else
  		render :new
  	end
 
  end
  
  	def edit
  	@editor = Editor.find(params[:id])
  	end
  
  	def destroy
  	  @editor = Editor.find(params[:id])
  	  @editor.destroy
  	  redirect_to editors_path
  	end
 
  	def update
	  	@editor = Editor.find(params[:id])
	  	if @editor.update_attributes(editor_params)
	  		redirect_to editor_path(@editor)
	  	else
	  		render :edit
	  	end
    end

  	def editor_params
  	  params.require(:editor).permit(:name, :phone, :birth_year)
  	end
 end