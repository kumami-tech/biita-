class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show
  layout 'no_wrapper', only: :show

  def show
    @user = User.find(params[:id])

    # 投稿一覧
    @giving_post_gs = @user.giving_post_gs
    @giving_post_cs = @user.giving_post_cs
    
    # 申込あり
    post_g_ids = PostGTaker.pluck(:post_g_id)
    @taken_post_gs = PostG.where(id: post_g_ids).where(giver_id: @user.id)
    post_c_ids = PostCTaker.pluck(:post_c_id)
    @taken_post_cs = PostC.where(id: post_c_ids).where(giver_id: @user.id)

    # 申込済み
    @taking_post_gs = @user.taking_post_gs
    @taking_post_cs = @user.taking_post_cs

    # お気に入り
    favorite_g_ids = @user.favorite_gs.pluck(:post_g_id)
    @favorite_gs = PostG.where(id: favorite_g_ids)
    favorite_c_ids = @user.favorite_cs.pluck(:post_c_id)
    @favorite_cs = PostC.where(id: favorite_c_ids)

    #レビュー
    reviews = Review.where(reviewee_id: @user.id)
    @count = reviews.count

    # メッセージ
    if user_signed_in?
      group_ids = @user.groups.pluck(:id)
      group_users = GroupUser.where(group_id: group_ids)
      group_user = group_users.where(user_id: current_user.id)
      @group_id = group_user.pluck(:group_id).first
    end

    @following_relationship = current_user.following_relationships.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email, :profile_image, :profile)
  end
end