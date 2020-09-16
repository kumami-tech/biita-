class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_reviewee
  layout 'no_wrapper', only: :index

  def index
    @reviews = Review.where(reviewee_id: @user.id).includes(:reviewer).order("reviews.created_at DESC")
    @review_gs = Review.where(reviewee_id: @user.id).where(position: "guest").includes(:reviewer).order("reviews.created_at DESC")
    @review_cs = Review.where(reviewee_id: @user.id).where(position: "cast").includes(:reviewer).order("reviews.created_at DESC")
  end
  
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      @review.create_notification_review!(current_user, @user)
      flash[:notice] = 'レビューを投稿しました。'
      redirect_to user_reviews_path
    else
      flash.now[:alert] = '入力に不備があります。'
      render :new
    end
  end

  private

  def set_reviewee
    @user = User.find(params[:user_id])
  end

  def review_params
    params.require(:review).permit(:position, :score, :content, :reviewee_id).merge(reviewer_id: current_user.id)
  end

end