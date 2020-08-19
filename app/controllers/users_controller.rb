class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @user = User.find(params[:id])
    @posts = @user.post_gs
    @posts_g = current_user.post_gs
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to posts_g_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email, :profile_image, :profile)
  end
end
