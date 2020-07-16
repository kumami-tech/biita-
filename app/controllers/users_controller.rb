class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.name
  end

  def show
    @posts = PostG.where(user_id: current_user.id)
    # user = User.find(params[:id])
    @name = current_user.name
    # posts_g = PostG.all
    @posts_g = current_user.post_gs
  end

  def edit
    user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email)
  end
end
