class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    Review.create(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
