class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    current_user.follow(@user)
    redirect_to user_path(@user.id)
    # respond_to do |format|
    #   format.html {redirect_back(fallback_location: root_url)}
    #   format.js
    # end
  end

  def destroy
    current_user.unfollow(@user)
    redirect_to user_path(@user.id)
    # respond_to do |format|
    #   format.html {redirect_back(fallback_location: root_url)}
    #   format.js
    # end
  end

  private
  def set_user
    @user = User.find(params[:relationship][:follower_id])
  end
end