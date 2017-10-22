class EditorsController < ApplicationController
	def index
  	  @editors = Editor.all
  	end

  	def show
  	# @editor = editor.find(params[:id])
    @editors = Editor.find_by(id: params[:id])

  	end
  
  	def edit
  	@editors = editors.find(params[:id])
  	end
  
  	def destroy
  	@editors = Editors.find(params[:id])
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

  	def editor_params
  	params.require(:editor).permit(:name, :phone, :editor_id)
  	end
  end
 end