class PostsCController < ApplicationController
  def index
    @posts = PostC.all
  end

  def new
    @post = PostC.new
  end
end
