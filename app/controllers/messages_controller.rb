class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  layout 'no_wrapper'

  def index
    @user = User.find_by(id: params[:user_id])
    @message = Message.new
    @messages = @group.messages.includes(:user)
    groups = current_user.groups.includes(:messages)
    @groups = groups.joins(:messages).order("messages.created_at DESC")
  end

  def create
    @message = @group.messages.new(message_params)
    @user = @group.users.where.not(id: current_user.id).first
    if @message.save
      @message.create_notification_message!(current_user, @user, @group)
      respond_to do |format|
        format.json
      end
      @user = @message.user
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end