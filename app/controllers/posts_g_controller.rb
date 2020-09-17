class PostsGController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, except: [:index, :new, :create]
  layout 'no_wrapper', only: :index

  def index
    @posts = PostG.includes(:giver).order("created_at DESC")
    @tags = PostG.all_tags.pluck(:name)

    if params[:keyword]
      @posts = PostG.search(params[:keyword])
    elsif params[:tag_name]
      @posts = PostG.tagged_with("#{params[:tag_name]}")
    end
  end

  def show
    @user = @post.giver
    reviews = Review.where(reviewee_id: @user.id)
    @count = reviews.count

    if user_signed_in?
      group_ids = @user.groups.pluck(:id)
      group_users = GroupUser.where(group_id: group_ids)
      group_user = group_users.where(user_id: current_user.id)
      @group_id = group_user.pluck(:group_id).first

      @favorite = @post.favorite_gs.where(user_id: current_user.id)
    end

    @takers = @post.takers
  end

  def new
    @post = PostG.new
  end

  def create
    @post = PostG.create(post_params)
    if @post.save
      flash[:notice] = '投稿しました。'
      redirect_to posts_g_path(@post)
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
      redirect_to posts_g_path(@post)
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
    @post.create_notification_apply_g!(current_user, @post.giver, @post)
    PostGTaker.create(post_g_id: @post.id, taker_id: current_user.id)
    flash[:notice] = '申し込みが完了しました。'
    redirect_to action: "show"
  end

  def cancel
    post_taker = PostGTaker.find_by(post_g_id: @post.id, taker_id: current_user.id)
    post_taker.destroy
    flash[:notice] = 'キャンセルが完了しました。'
    redirect_to action: "show"
  end

  private
  def post_params
    params.require(:post_g).permit(:title, :tag_list, :region, :datetime, :content, :charge, :payment).merge(giver_id: current_user.id)
  end

  def set_post
    @post = PostG.find(params[:id])
  end
end