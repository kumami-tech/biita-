class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_user

  def followings
    @followings = @user.followings
    @followers = @user.followers
  end

  def followers
    @followings = @user.followings
    @followers = @user.followers
  end

  def create
    current_user.follow(@user)
    @user.create_notification_follow!(current_user, @user)
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