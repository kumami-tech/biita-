class PostsCController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, except: %i[index new create]
  layout 'no_wrapper', only: :index

  def index
    @posts = PostC.includes(:giver)
    @tags = PostC.all_tags.order("taggings_count DESC").pluck(:name)

    if params[:keyword]
      @posts = PostC.search(params[:keyword])
    elsif params[:tag_name]
      @posts = PostC.tagged_with(params[:tag_name].to_s)
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

      @favorite = @post.favorite_cs.where(user_id: current_user.id)
    end

    @takers = @post.takers
  end

  def new
    @post = PostC.new
  end

  def create
    @post = PostC.create(post_params)
    if @post.save
      flash[:notice] = '投稿しました。'
      redirect_to posts_c_path(@post)
    else
      flash[:alert] = '入力に不備があります。'
      render "new"
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = '投稿を編集しました。'
      redirect_to posts_c_path(@post)
    else
      flash[:alert] = '入力に不備があります。'
      render "edit"
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = '投稿を削除しました。'
    redirect_to root_path
  end

  def take
    @post.create_notification_apply_c!(current_user, @post.giver, @post)
    PostCTaker.create(post_c_id: @post.id, taker_id: current_user.id)
    flash[:notice] = '申し込みが完了しました。'
    redirect_to action: "show"
  end

  def cancel
    @post.create_notification_cancel_c!(current_user, @post.giver, @post)
    post_taker = PostCTaker.find_by(post_c_id: @post.id, taker_id: current_user.id)
    post_taker.destroy
    flash[:notice] = 'キャンセルが完了しました。'
    redirect_to action: "show"
  end

  private

  def post_params
    params.require(:post_c).permit(:title, :tag_list, :image, :region, :datetime, :content, :charge, :payment).merge(giver_id: current_user.id)
  end

  def set_post
    @post = PostC.find(params[:id])
  end
end
