class MessagesController < ApplicationController
  before_action :set_group

  def index
    @user = User.find_by(id: params[:user_id])
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = @group.messages.new(message_params)
    @user = @group.users.last
    if @message.save
      @user = @message.user
      redirect_to action: :index, group_id: @group.id, user_id: @user.id
    else
      @messages = @group.messages.includes(:user)
      render :index
    end
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