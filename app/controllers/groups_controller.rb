class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    groups = current_user.groups.includes(:messages)
    @groups = groups.joins(:messages).order("messages.created_at DESC")
  end

  def create
    group = Group.create
    group_user = GroupUser.create(group_id: group.id, user_id: current_user.id)
    @user = User.find(params[:id])
    group_user = GroupUser.create(group_id: group.id, user_id: @user.id)
    @group_id = group_user.group_id
    redirect_to group_messages_path(@group_id, user_id: @user.id)
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