class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @user = User.find(params[:id])
    @giving_post_gs = @user.giving_post_gs
    @giving_post_cs = @user.giving_post_cs
    
    post_g_ids = PostGTaker.pluck(:post_g_id)
    @taken_post_gs = PostG.where(id: post_g_ids).where(giver_id: @user.id)
    post_c_ids = PostCTaker.pluck(:post_c_id)
    @taken_post_cs = PostC.where(id: post_c_ids).where(giver_id: @user.id)

    @taking_post_gs = @user.taking_post_gs
    @taking_post_cs = @user.taking_post_cs

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