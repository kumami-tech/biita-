class FavoriteCsController < ApplicationController
  before_action :authenticate_user!
  before_action :set

  def create
    FavoriteC.create(user_id: current_user.id, post_c_id: params[:posts_c_id])
    @post.create_notification_favorite_c!(current_user, @user, @post)
  end

  def destroy
    favorite = FavoriteC.find_by(post_c_id: params[:posts_c_id], user_id: current_user.id)
    favorite.destroy
  end

  private

  def set
    @post = PostC.find(params[:posts_c_id])
    @user = @post.giver
    @favorite = @post.favorite_cs.where(user_id: current_user.id)
  end
end
