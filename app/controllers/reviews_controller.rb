class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_reviewee

  def index
    @reviews = @user.reviews.includes(:user)
  end
  
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = 'レビューを投稿しました。'
      redirect_to user_reviews_path
    else
      flash.now[:alert] = 'レビューを投稿できませんでした。'
      render :new
    end
  end

  private

  def set_reviewee
    @user = User.find(params[:user_id])
  end

  def review_params
    params.require(:review).permit(:content, :score, :reviewee_id).merge(reviewer_id: current_user.id)
  end

end