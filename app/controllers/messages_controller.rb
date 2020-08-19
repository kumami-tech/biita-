class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def index
    @user = User.find_by(id: params[:user_id])
    @message = Message.new
    @messages = @group.messages.includes(:user)
    groups = current_user.groups.includes(:messages)
    @groups = groups.joins(:messages).order("messages.created_at DESC")
  end

  def create
    @message = @group.messages.new(message_params)
    @user = @group.users.last
    if @message.save
      respond_to do |format|
        format.json
      end
      @user = @message.user
    else
      render :index
    end
    # redirect_to action: :index, group_id: @group.id, user_id: @user.id

  end

  def show
    @user = User.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end