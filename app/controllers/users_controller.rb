class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]
  def index
  	@users = User.all
  end

  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to users_path
      flash[:success] = "You've already successfully created #{@user.name}"
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @user.update_attributes(user_params)
  		redirect_to user_path(@user)
      flash[:success] = "You've already successfully updated #{@user.name}"
  	else
  		render :edit
  	end
  end

  def destroy
  	@user.destroy
  	redirect_to users_path
    flash[:success] = "You've already successfully deleted #{@user.name}"
  end

  private
    def find_user
      @user = User.find(params[:id])
    end

    def user_params
    	params.require(:user).permit(:name, :sex, :age, :address)
    end
end