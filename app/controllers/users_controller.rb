class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(list_params)
    redirect_to list_path(list.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
