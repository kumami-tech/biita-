class RelationshipsController < ApplicationController
  before_action :set_user

  def index
    @followings = @user.followings
    @followers = @user.followers
  end

  def create
    current_user.follow(@user)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
      format.js
    end
  end

  def destroy
    current_user.unfollow(@user)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
      format.js
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end