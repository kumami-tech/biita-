class PostsGController < ApplicationController
  before_action :set_post, only: [:edit]
  before_action :move_to_index, except: [:index]

  def index
    @posts = PostG.includes(:user).order("created_at DESC")
  end

  def new
    @post = PostG.new
  end

  def create
    @post = PostG.create(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @post = PostG.find(params[:id])
  end

  def update
    post = PostG.find(params[:id])
    post.update(post_params)
    redirect_to posts_g_path(post.user)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.post_gs
    @posts_g = current_user.post_gs

    groups = @user.groups.pluck(:id)
    group_users = GroupUser.where(group_id: groups)
    group_user = group_users.where(user_id: current_user.id)
    @group_id = group_user.pluck(:group_id).first
  end

  def destroy
    post = PostG.find(params[:id])
    post.destroy
  end

  private
  def post_params
    params.require(:post_g).permit(:region, :datetime, :content, :charge).merge(user_id: current_user.id)
  end

  def set_post
    @post = PostG.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end