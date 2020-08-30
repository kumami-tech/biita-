class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @user = User.find(params[:id])
    @post_gs = @user.post_gs
    @post_cs = @user.post_cs
    @reviews = Review.where(reviewee_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email, :profile_image, :profile)
  end
end
