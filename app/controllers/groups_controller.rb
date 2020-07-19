class GroupsController < ApplicationController

  def create
    group = Group.create
    group_user = GroupUser.create(group_id: group.id, user_id: current_user.id)
    @user = User.find(params[:id])
    group_user = GroupUser.create(group_id: group.id, user_id: @user.id)
    redirect_to posts_g_path(@user.id)
  end

  def show
    @group = Group.find(params[:id])
    group_user = GroupUser.where(group_id: @group.id)
    group_user1 = group_user[1]
    user_id = group_user_id.user_id
    @user = User.where(id: user_id)
  end

  private
  def group_params
    params.permit(:id, user_ids: [])
  end

end