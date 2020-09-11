class FavoriteGsController < ApplicationController
  def create
    FavoriteG.create!(user_id: current_user.id, post_g_id: params[:post_g_id])
    redirect_to posts_g_path(params[:posts_g_id])
  end

  def destroy
    favorite = FavoriteG.find_by(post_g_id: params[:post_g_id], user_id: current_user.id)
    favorite.destroy
    redirect_to posts_g_path(params[:posts_g_id])
  end
end