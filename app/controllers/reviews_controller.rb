class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @user = User.find(params[:user_id])
  end
  
  def create
    @user = User.find(params[:user_id])
    @review = @user.reviews.new(review_params)
    if @review.save
      respond_to do |format|
        # format.html { redirect_to "/users/#{@user.id}/reviews" }
        format.json
      end
    else
      @reviews = @user.reviews.includes(:user)
      render :index
    end
  end

  private

  def review_params
    params.require(:review).permit(:content).merge(user_id: current_user.id)
  end

end