class MessagesController < ApplicationController
  before_action :set_group

  def index
    @user = @group.users.last
    @user = User.find_by(id: params[:user_id])
  end

  def create
    @message = Message.new
    redirect_to group_path(@message.group_id)
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





# class MessagesController < ApplicationController
#   before_action :set_group

#   def index
#     @message = Message.new
#     @messages = @group.messages.includes(:user)
#   end

#   def create
#     @message = @group.messages.new(message_params)
#     if @message.save
#       respond_to do |format|
#         format.json
#       end
#     else
#       @messages = @group.messages.includes(:user)
#       flash.now[:alert] = 'メッセージを入力してください'
#       render :index
#     end
#   end

#   private

#   def message_params
#     params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
#   end

#   def set_group
#     @group = Group.find(params[:group_id])
#   end

# end
