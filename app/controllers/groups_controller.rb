class GroupsController < ApplicationController
  before_action :authenticate_user!
  layout 'no_wrapper'

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
end
