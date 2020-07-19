class ReviewsController < ApplicationController
  def create

    @review = Review.create(review_params)
    respond_to do |format|
      format.html { redirect_to review_path(params[:user_id])  }
      format.json
    end

    # @review = Review.create(review_params)
    # if @review.save
    #   redirect_to review_path(@user.id)
    # else
    #   render :new
    # end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def review_params
    params.require(:review).permit(:content).merge(user_id: current_user.id)
  end
end
