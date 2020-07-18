class PostsCController < ApplicationController
  before_action :set_post, only: [:edit]
  before_action :move_to_index, except: [:index]

  def index
    @posts = PostC.includes(:user).order("created_at DESC")
  end

  def new
    @post = PostC.new
  end

  def create
    @post = PostC.create(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @post = PostC.find(params[:id])
  end

  def update
    post = PostC.find(params[:id])
    post.update(post_params)
    redirect_to posts_c_path(post.user)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.post_cs
    @posts_g = current_user.post_cs

    groups = @user.groups.pluck(:id)
    group = GroupUser.where(group_id: groups)
    @group = group.where(user_id: current_user.id)
  end

  def destroy
    post = PostC.find(params[:id])
    post.destroy
  end

  private
  def post_params
    params.require(:post_c).permit(:region, :datetime, :content, :charge).merge(user_id: current_user.id)
  end

  def set_post
    @post = PostC.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end