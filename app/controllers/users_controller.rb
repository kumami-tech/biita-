class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @user = User.find(params[:id])
    @post_gs = @user.post_gs
    @post_cs = @user.post_cs
    reviews = Review.where(reviewee_id: @user.id)
    @count = reviews.count

    group_ids = @user.groups.pluck(:id)
    group_users = GroupUser.where(group_id: group_ids)
    group_user = group_users.where(user_id: current_user.id)
    @group_id = group_user.pluck(:group_id).first
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
