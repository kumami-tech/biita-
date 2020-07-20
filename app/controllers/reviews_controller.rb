class ReviewsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end
  
  def create
    @review = current_user.reviews.create(review_params)
    if @review.save
      respond_to do |format|
        format.json
      end
    else
      @reviews = @user.reviews.includes(:user)
      render :index
    end
  end

  private

  def review_params
    params.require(:review).permit(:content).merge(user_id: current_user.id, profile_image: current_user.profile_image)
  end

end
