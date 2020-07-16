class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = User.new
  end

  def show
    @posts = PostG.where(user_id: current_user.id)
    @user = User.find(params[:id])
    # user = User.find(params[:id])
    @name = current_user.name
    # posts_g = PostG.all
    @posts_g = current_user.post_gs
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :create
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      # binding.pry
      redirect_to request.referer
      # redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email, :profile_image, :profile)
  end
end
