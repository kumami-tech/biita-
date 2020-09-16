class FavoriteGsController < ApplicationController
  before_action :authenticate_user!
  before_action :set

  def create
    FavoriteG.create(user_id: current_user.id, post_g_id: params[:posts_g_id])
    @post.create_notification_favorite_g!(current_user, @user, @post)
  end

  def destroy
    favorite = FavoriteG.find_by(post_g_id: params[:posts_g_id], user_id: current_user.id)
    favorite.destroy
  end

  private
  def set
    @post = PostG.find(params[:posts_g_id])
    @user = @post.giver
    @favorite = @post.favorite_gs.where(user_id: current_user.id)
  end

end