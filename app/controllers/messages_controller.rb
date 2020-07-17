class MessagesController < ApplicationController
  # before_action :set_group

  # def create
  #   @message = Message.new
  #   redirect_to message_path(@message.user.id)
  # end

  def show
    # binding.pry
    @user = User.find(params[:id])
    # @message = Message.new
    # @messages = @group.messages.includes(:user)
  end

  # def set_group
  #   @group = Group.find(params[:group_id])
  # end

  private

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id)
  end
end
