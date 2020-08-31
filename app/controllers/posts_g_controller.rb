class PostsGController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:edit]

  def index
    @posts = PostG.includes(:user).order("created_at DESC")
  end

  def new
    @post = PostG.new
  end

  def create
    @post = PostG.create(post_params)
    if @post.save
      flash[:notice] = '投稿しました。'
      redirect_to root_path
    else
      flash[:alert] = '入力に不備があります。'
      redirect_to action: "new"
    end
  end

  def edit
    @post = PostG.find(params[:id])
  end

  def update
    post = PostG.find(params[:id])
    if post.update(post_params)
      flash[:notice] = '投稿を編集しました。'
      redirect_to root_path
    else
      flash[:alert] = '入力に不備があります。'
      redirect_to action: "edit"
    end
  end

  def destroy
    post = PostG.find(params[:id])
    post.destroy
    flash[:notice] = '投稿を削除しました。'
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post_g).permit(:region, :datetime, :content, :charge).merge(user_id: current_user.id)
  end

  def set_post
    @post = PostG.find(params[:id])
  end
end