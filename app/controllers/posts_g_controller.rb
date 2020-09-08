class PostsGController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, except: [:index, :new, :create]

  def index
    @posts = PostG.includes(:giver).order("created_at DESC")
  end

  def show
    @user = @post.giver
    reviews = Review.where(reviewee_id: @user.id)
    @count = reviews.count

    group_ids = @user.groups.pluck(:id)
    group_users = GroupUser.where(group_id: group_ids)
    group_user = group_users.where(user_id: current_user.id)
    @group_id = group_user.pluck(:group_id).first
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
  end

  def update
    if @post.update(post_params)
      flash[:notice] = '投稿を編集しました。'
      redirect_to root_path
    else
      flash[:alert] = '入力に不備があります。'
      redirect_to action: "edit"
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = '投稿を削除しました。'
    redirect_to root_path
  end

  def take
    PostGTaker.create(post_g_id: @post.id, taker_id: current_user.id)
    flash[:notice] = '申し込みが完了しました。'
    redirect_to action: "show"
  end

  private
  def post_params
    params.require(:post_g).permit(:title, :region, :datetime, :content, :charge, :payment).merge(giver_id: current_user.id)
  end

  def set_post
    @post = PostG.find(params[:id])
  end
end