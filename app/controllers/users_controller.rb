class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_user, except: :update
  layout 'no_wrapper', only: :show

  def show
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

    # レビュー
    reviews = Review.where(reviewee_id: @user.id)
    @count = reviews.count

    # メッセージ
    return unless user_signed_in?

    group_ids = @user.groups.pluck(:id)
    group_users = GroupUser.where(group_id: group_ids)
    group_user = group_users.where(user_id: current_user.id)
    @group_id = group_user.pluck(:group_id).first
  end

  def edit; end

  def update
    if current_user.update(user_params)
      flash[:notice] = 'プロフィールを編集しました。'
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = 'プロフィールを編集できませんでした。'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :name, :email, :profile_image, :profile)
  end
end
