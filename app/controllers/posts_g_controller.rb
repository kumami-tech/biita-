class PostsGController < ApplicationController
  before_action :set_tweet, only: [:edit]
  before_action :move_to_index, except: [:index]

  def index
    @posts = PostG.includes(:user).order("created_at DESC")
  end

  def new
    @post = PostG.new
  end


  private
  def set_post
    @post = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end