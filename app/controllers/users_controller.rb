class UsersController < ApplicationController
before_action :authenticate_user!,except: [:top]

  def index
    @user = current_user
    @users = User.all
  end
  
  
  def show
    @user = User.find(params[:id])
    @items = @user.items
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

 private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end